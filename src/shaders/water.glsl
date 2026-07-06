#version 330 core
// Water surface — two stacked sine waves and a foam band

uniform float u_time;
uniform vec2 u_resolution;
uniform vec3 u_shallow;
uniform vec3 u_deep;

in vec2 v_uv;
out vec4 frag_color;

float wave(vec2 p, float speed, float freq, float amp) {
    return sin(p.x * freq + u_time * speed) * amp;
}

void main() {
    vec2 uv = v_uv;
    float h = wave(uv, 1.3, 12.0, 0.02) + wave(uv.yx, 0.7, 7.0, 0.015);
    float depth = smoothstep(0.0, 1.0, uv.y + h);
    vec3 color = mix(u_shallow, u_deep, depth);
    float foam = step(0.97, fract(uv.y * 20.0 + h * 40.0 + u_time * 0.5));
    frag_color = vec4(mix(color, vec3(1.0), foam * 0.6), 0.85);
}
