import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    // Timer to let time for the fade
    Timer {
        id: delayedLoginTimer
        interval: 300
        repeat: false
        onTriggered: {
            sddm.login(user_entry.text, pw_entry.text, sessionIndex)
        }
    }

    width: 1920
    height: 1080

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    TextConstants { id: textConstants }

    Connections {
        target: sddm
        onLoginSucceeded: {
            loginContainer.opacity = 0.0
        }
        onInformationMessage: {
        }
        onLoginFailed: {
            pw_entry.text = ""
            loginContainer.opacity = 1.0
        }
    }

    Background {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status == Image.Error && source != config.defaultBackground) {
                source = config.defaultBackground
            }
        }
    }
    // TMP
    Image {
        anchors.fill: parent
        anchors.margins: 0
        source: "images/background.png"
    }

    // Container
    Rectangle {
        id: loginContainer
        anchors.fill: parent
        color: "#00000000"
        z: 1
        opacity: 1.0

        Behavior on opacity {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }

        Component.onCompleted: {
            loginContainer.opacity = 1.0
        }

        Item {
            anchors.margins: 20
            anchors.fill: parent

            // Date
            Timer {
                id: date
                interval: 100
                running: true
                repeat: true

                onTriggered: {
                    dateText.text = Qt.formatDateTime(new Date(), "dddd, dd MMMM")
                }
            }
            Text {
                id: dateText
                anchors.top: parent.top;
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignRight
                anchors.margins: 60

                color: "#ccffffff"
                font.bold: true
                font.family: "Sans"
                font.pixelSize: 27
            }

            // Time
            Timer {
                id: time
                interval: 100
                running: true
                repeat: true

                onTriggered: {
                    timeText.text = Qt.formatDateTime(new Date(), "HH:mm")
                }
            }
            Text {
                id: timeText
                anchors.top: parent.top;
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignRight
                anchors.margins: 80

                color: "#ccffffff"
                font.bold: true
                font.family: "Sans"
                font.pixelSize: 120
            }

            // Inputs
            // User image
            Image {
                anchors.top: parent.top;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 350
                source: "images/user_icon.png"
                width: 150
                height: 150
            }

            // User name
            Rectangle {
                anchors.top: parent.top;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 0, 0, 0, 550
                width: 300
                height: 40
                radius: 100
                color: "#80ffffff"
                border.width: 2
                border.color: user_entry.activeFocus ? "#b0ffffff" : "#80ffffff"

                TextInput {
                    id: user_entry
                    anchors.fill: parent
                    anchors.margins: 5

                    color: "#ffffff"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: userModel.lastUser
                    font.bold: true

                    cursorVisible: control.focus
                    selectByMouse: true

                    KeyNavigation.backtab: reboot_button;
                    KeyNavigation.tab: pw_entry
                }
            }

            // Password Box
            Rectangle {
                anchors.top: parent.top;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 0, 0, 0, 610
                width: 300
                height: 40
                radius: 100
                color: "#80ffffff"
                border.width: 2
                border.color: pw_entry.activeFocus ? "#b0ffffff" : "#80ffffff"

                PasswordBox {
                    id: pw_entry
                    anchors.fill: parent
                    anchors.margins: 5

                    color: "transparent"
                    borderColor : "transparent"
                    focusColor  : "transparent"
                    hoverColor  : "transparent"
                    textColor   : "#ffffff"

                    font.pixelSize: 20
                    font.bold: true

                    KeyNavigation.backtab: user_entry;
                    KeyNavigation.tab: login_button

                    Keys.onPressed: {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            loginContainer.opacity = 0.0
                            delayedLoginTimer.start()
                            event.accepted = true
                        }
                    }
                }
            }

            // Session Box
            Rectangle {
                anchors.top: parent.top;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 0, 0, 0, 670
                width: 300
                height: 40
                radius: 100
                color: "#80ffffff"
                border.width: 2
                border.color: pw_entry.activeFocus ? "#b0ffffff" : "#80ffffff"

                ComboBox {
                    id: session
                    anchors.fill: parent
                    anchors.margins: 5

                    color: "transparent"
                    borderColor : "transparent"
                    focusColor  : "transparent"
                    hoverColor  : "transparent"
                    textColor   : "#ffffff"
                    menuColor   : "#80ffffff"

                    arrowIcon: "images/angle-down.png"
                    arrowColor: "transparent"

                    model: sessionModel
                    index: sessionModel.lastIndex

                    font.pixelSize: 20

                    KeyNavigation.backtab: login_button;
                    KeyNavigation.tab: shutdown_button;
                }
            }

            // Validate Button
            Rectangle {
                x: 1100
                y: 615
                width: 30
                height: 30
                color: "transparent"

                ImageButton {
                    id: login_button
                    anchors.fill: parent

                    source: "images/validate.png"

                    onClicked: {
                        loginContainer.opacity = 0.0
                        delayedLoginTimer.start()
                    }

                    KeyNavigation.backtab: pw_entry;
                    KeyNavigation.tab: session
                }
            }

            // System Buttons
            Rectangle {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 0, 0, 0, 870
                width: 230
                height: 100
                color: "transparent"
                border.width: 0

                Row {
                    id: buttonRow
                    anchors.fill: parent

                    spacing: 30

                    ImageButton {
                        id: shutdown_button
                        source: "images/system_shutdown.png"
                        onClicked: sddm.powerOff()

                        KeyNavigation.backtab: session;
                        KeyNavigation.tab: reboot_button
                    }

                    ImageButton {
                        id: reboot_button
                        source: "images/system_reboot.png"
                        onClicked: sddm.reboot()

                        KeyNavigation.backtab: shutdown_button;
                        KeyNavigation.tab: user_entry
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        if (user_entry.text === "")
        user_entry.focus = true
        else
        pw_entry.focus = true
    }
}
