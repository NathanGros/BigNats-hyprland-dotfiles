import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
	width: 1920
	height: 1080

	LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
	LayoutMirroring.childrenInherit: true

	property int sessionIndex: session.index

	TextConstants { id: textConstants }

	Connections {
		target: sddm
		onInformationMessage: {
		}
		onLoginFailed: {
			pw_entry.text = ""
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

				color: "#1e1e2e"
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

				color: "#1e1e2e"
				font.bold: true
				font.family: "Sans"
				font.pixelSize: 120
			}

			// Inputs
			// User name
			Rectangle {
				anchors.top: parent.top;
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.horizontalCenterOffset: 100
				anchors.margins: 0, 0, 0, 440
				width: 250
				height: 40
				radius: 10
				color: "#1e1e2e"
				border.width: 2
				border.color: user_entry.activeFocus ? "#cdd6f4" : "#1e1e2e"

				TextInput {
					id: user_entry
					anchors.fill: parent
					anchors.margins: 5

					color: "#cdd6f4"
					font.pixelSize: 20
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					text: userModel.lastUser
					font.bold: true

					selectByMouse: true

					KeyNavigation.backtab: reboot_button;
					KeyNavigation.tab: pw_entry
				}
			}

			// Password Box
			Rectangle {
				anchors.top: parent.top;
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.horizontalCenterOffset: 100
				anchors.margins: 0, 0, 0, 500
				width: 250
				height: 40
				radius: 10
				color: "#1e1e2e"
				border.width: 2
				border.color: pw_entry.activeFocus ? "#cdd6f4" : "#1e1e2e"

				MyPasswordBox {
					id: pw_entry
					anchors.fill: parent
					anchors.margins: 5

					color: "transparent"
					borderColor : "transparent"
					focusColor  : "transparent"
					hoverColor  : "transparent"
					textColor   : "#cdd5f4"

					font.pixelSize: 20
					font.bold: true
					anchors.verticalCenter: parent.verticalCenter

					KeyNavigation.backtab: user_entry;
					KeyNavigation.tab: session

					Keys.onReturnPressed: sddm.login(user_entry.text, pw_entry.text, sessionIndex)
					Keys.onEnterPressed:  sddm.login(user_entry.text, pw_entry.text, sessionIndex)
				}
			}

			// Session Box
			Rectangle {
				anchors.top: parent.top;
				anchors.horizontalCenter: parent.horizontalCenter
				anchors.horizontalCenterOffset: 100
				anchors.margins: 0, 0, 0, 560
				width: 250
				height: 40
				radius: 10
				color: "#1e1e2e"
				border.width: 2
				border.color: session.activeFocus ? "#cdd6f4" : "#1e1e2e"

				MyComboBox {
					id: session
					anchors.fill: parent
					anchors.margins: 5

					color: "transparent"
					borderColor : "transparent"
					focusColor  : "transparent"
					hoverColor  : "transparent"
					textColor   : "#cdd6f4"
					menuColor   : "#11111b"

					arrowIcon: "images/angle-down.png"
					arrowColor: "transparent"

					model: sessionModel
					index: sessionModel.lastIndex

					font.pixelSize: 20

					KeyNavigation.backtab: pw_entry;
					KeyNavigation.tab: shutdown_button;
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
						opacity: 1.0

						KeyNavigation.backtab: session;
						KeyNavigation.tab: reboot_button
					}

					ImageButton {
						id: reboot_button
						source: "images/system_reboot.png"
						onClicked: sddm.reboot()
						opacity: 1.0

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
