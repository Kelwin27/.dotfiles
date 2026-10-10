{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  # Noctalia locks through PAM's `login` service, which already carries the
  # gnome-keyring rules, so the hyprlock stanza is no longer needed.
}
