{
  inputs,
  python3,
  runtimeShell,
  ...
}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs {pkgs = final;};

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  modifications = final: prev:
  # https://nixos.wiki/wiki/Overlays
  # keyd follow commit may 28, 2024
  let
    #version is when i create this overlay
    version = "16-05-2024";
    src = final.fetchFromGitHub {
      owner = "rvaiya";
      repo = "keyd";
      rev = "ce1bab682baf98396b957b4c7950c89413b4c96f";
      # hash = "sha256-0zlz4qlfj86LdzXPQFo8j8AUdLn2lScNXRGO7x4aHVg=";
      hash = "sha256-0zlz4qlfj86LdzXPQFo8j8AUdLn2lScNXRGO7x4aHVg=";
    };
    pypkgs = python3.pkgs;

    appMap = pypkgs.buildPythonApplication {
      pname = "keyd-application-mapper";
      inherit version src;
      format = "other";

      postPatch = ''
        substituteInPlace scripts/keyd-application-mapper \
          --replace /bin/sh ${runtimeShell}
      '';

      propagatedBuildInputs = with pypkgs; [xlib];

      dontBuild = true;

      installPhase = ''
        install -Dm555 -t $out/bin scripts/keyd-application-mapper
      '';

      meta.mainProgram = "keyd-application-mapper";
    };
  in {
    keyd = prev.keyd.overrideAttrs (oldAttrs: {
      inherit src;
      # postPatch = ''
      #   substituteInPlace Makefile \
      #     --replace-quiet /usr ""
      #
      #   # cp keyd.service.in keyd.service
      #
      #   substituteInPlace keyd.service.in \
      #     --replace-quiet /usr/local/bin $out/local/bin
      # '';

      postPatch = ''
        substituteInPlace Makefile \
          --replace /usr/local ""

        substituteInPlace keyd.service.in \
          --replace /usr/local $out

        substituteInPlace src/vkbd/usb-gadget.service.in \
          --replace /usr/local $out
      '';
      #
      # postInstall = ''
      #   ln -sf ${final.lib.getExe appMap} $out/local/bin/${appMap.pname}
      #   rm -rf $out/etc
      # '';
      #

      postInstall = ''
        ln -sf ${final.lib.getExe appMap} $out/bin/${appMap.pname}
        rm -rf $out/etc

        # Ensure necessary directories are created
        mkdir -p $out/lib/systemd/system/
        mkdir -p $out/bin/
        mkdir -p $out/share/keyd/
        mkdir -p $out/share/keyd/layouts/
        mkdir -p $out/share/man/man1/
        mkdir -p $out/share/doc/keyd/
        mkdir -p $out/share/doc/keyd/examples/

        # Install the service files
        install -Dm644 keyd.service $out/lib/systemd/system/keyd.service

        # If usb-gadget is enabled, install additional service files
        if [ "$(VKBD)" = "usb-gadget" ]; then
          install -Dm644 src/vkbd/usb-gadget.service $out/lib/systemd/system/keyd-usb-gadget.service
          install -Dm755 src/vkbd/usb-gadget.sh $out/bin/keyd-usb-gadget.sh
        fi

        # Install the main binary and other files
        install -m755 bin/* $out/bin/
        install -m644 docs/*.md $out/share/doc/keyd/
        install -m644 examples/* $out/share/doc/keyd/examples/
        install -m644 layouts/* $out/share/keyd/layouts/
        cp -r data/gnome-* $out/share/keyd
        install -m644 data/*.1.gz $out/share/man/man1/
        install -m644 data/keyd.compose $out/share/keyd/
      '';
    });
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
