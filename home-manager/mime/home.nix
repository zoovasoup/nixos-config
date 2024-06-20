{...}: {
  xdg.mime.enable = true;

  # configuring default application
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "one.ablaze.floorp.desktop";
      "x-scheme-handler/https" = "one.ablaze.floorp.desktop";
      "x-scheme-handler/about" = "one.ablaze.floorp.desktop";
      "x-scheme-handler/unknown" = "one.ablaze.floorp.desktop";
      "text/html" = "one.ablaze.floorp.desktop";
      "application/xhtml+xml" = "one.ablaze.floorp.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
      "x-scheme-handler/chrome" = "floorp.desktop";
      "application/x-extension-htm" = "floorp.desktop";
      "application/x-extension-html" = "floorp.desktop";
      "application/x-extension-shtml" = "floorp.desktop";
      "application/x-extension-xhtml" = "floorp.desktop";
      "application/x-extension-xht" = "floorp.desktop";
    };
    associations.added = {
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
