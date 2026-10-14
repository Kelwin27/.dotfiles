# Magic Context читает единый конфиг из ~/.config/cortexkit/ (не из ~/.config/opencode/).
# Проектные переопределения: <project>/.cortexkit/magic-context.jsonc
{ ... }:
{
  xdg.configFile."cortexkit/magic-context.jsonc".source = ./magic-context.jsonc;
}
