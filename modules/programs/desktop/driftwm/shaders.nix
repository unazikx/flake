{
  ...
}:

{
  zen.programs.desktop.driftwm.shaders = {
    description = ''
      modern clipboard with tofi frontend
      clipboard entries are in ~/.cache/clapboard
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.driftwm.settings.background = {
          type = "shader";
          path =
            pkgs.writeText "driwftwm-shaders.glsl"
              # glsl
              ''
                precision highp float;

                varying vec2 v_coords;
                uniform vec2 size;
                uniform float alpha;
                uniform vec2 u_camera;

                float hash1(vec2 p) {
                    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
                }

                float noise(vec2 p) {
                    vec2 i = floor(p);
                    vec2 f = fract(p);
                    f = f * f * (3.0 - 2.0 * f);
                    return mix(mix(hash1(i), hash1(i + vec2(1.0, 0.0)), f.x), 
                               mix(hash1(i + vec2(0.0, 1.0)), hash1(i + vec2(1.0, 1.0)), f.x), f.y);
                }

                float fbm(vec2 p) {
                    float v = 0.0;
                    float a = 0.5;
                    for (int i = 0; i < 4; i++) {
                        v += a * noise(p);
                        p = mat2(0.8, 0.6, -0.6, 0.8) * p * 2.0;
                        a *= 0.5;
                    }
                    return v;
                }

                vec3 paletteColor(float t) {
                    if (t < 0.390) return vec3(0.08235);
                    if (t < 0.525) return mix(vec3(0.08235), vec3(0.12157), 0.55);
                    if (t < 0.620) return mix(vec3(0.08235), vec3(0.18039), 0.55);
                    return mix(vec3(0.08235), vec3(0.25882), 0.65);
                }

                void main() {
                    float f = fbm((v_coords * size + u_camera) * 0.0022);
                    gl_FragColor = vec4(paletteColor(f), 1.0) * alpha;
                }
              '';
        };
      };
  };
}
