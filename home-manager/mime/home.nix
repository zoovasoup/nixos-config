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
    };
    associations.added = {
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
