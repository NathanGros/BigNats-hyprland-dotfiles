#version 300 es
precision mediump float;

in vec2 v_texcoord;
out vec4 fragColor;

uniform sampler2D tex;

void main() {
    vec4 color = texture(tex, v_texcoord);
//	float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
//	float gray = dot(color.rgb, vec3(0.5, 0.5, 0.));
    fragColor = vec4(color.r, color.g * 0.5, 0, color.a);
}
