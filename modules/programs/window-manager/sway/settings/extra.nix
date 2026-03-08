{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;

# fish
''
  corner_radius 10
  blur enable
  blur_xray off
  shadows enable
  shadows_on_csd enable
  shadow_color ${base00}
  shadow_blur_radius 12
  default_dim_inactive 0.4
  layer_effects "waybar" shadows disable; corner_radius 0; blur disable
''
