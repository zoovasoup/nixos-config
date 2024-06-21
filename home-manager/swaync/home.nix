{...}: {
  home.file.".config/swaync" = {
    source = ./swaync;
    target = ".config/swaync";
    recursive = true;
    executable = true;
  };

  services.swaync = {
    enable = true;
    style = ''
      @define-color cc-bg #222222;
      @define-color noti-border-color #333333;
      @define-color noti-bg #333333;
      @define-color noti-bg-darker #333333;
      @define-color noti-bg-hover green;
      @define-color noti-bg-focus violet;
      @define-color text-color #888888;
      @define-color text-color-disabled #93a1a1;
      @define-color bg-selected #4c7899;

      * {
        font-family: monospace;
        font-size: 12px;
        box-shadow: unset;
        border-radius: unset;
      }

      .notification-row {
        outline: none;
        padding: 0;
      }

      .notification {
        background: @cc-bg;
        margin: 0px;
      }

      .notification-content {
        background: @cc-bg;
        border-radius: 0px;
        border: 2px solid @noti-border-color;
        box-shadow: none;
        padding: 3px;
      }

      .close-button {
        background: #4c7899;
        color: @cc-bg;
        text-shadow: none;
        padding: 0;
        border-radius: 0px;
        margin-top: 5px;
        margin-right: 5px;
      }

      .close-button:hover {
        box-shadow: none;
        background: #4c7899;
        transition: all 0.15s ease-in-out;
        border: none;
      }

      .notification-action {
        color: #93a1a1;
        border: 2px solid #4c7899;
        border-top: none;
        border-radius: 0px;
        background: #222222;
        padding: 3px;
      }

      .notification-default-action:hover,
      .notification-action:hover {
        color: #93a1a1;
        background: #32302f;
      }

      .summary {
        padding-top: 3px;
        padding-bottom: 3px;
        font-size: 13px;
        color: #93a1a1;
      }

      .time {
        font-size: 11px;
        color: #4c7899;
        margin-right: 5px;
      }

      .body {
        font-size: 13px;
        color: #93a1a1;
      }

      .control-center {
        background: @cc-bg;
        border: 2px solid #4c7899;
        border-radius: 0px;
      }

      .control-center-list {
        background: transparent;
      }

      .control-center-list-placeholder {
        opacity: 0.5;
      }

      .floating-notifications {
        background: transparent;
      }

      .blank-window {
        background: alpha(black, 0.1);
      }

      .widget-title {
        color: #93a1a1;
        /*background: @noti-bg-darker;*/
        background: transparent;
        border-bottom: 1px solid #93a1a1;
        padding: 10px 5px 10px 5px;
        margin: 5px 10px 5px 10px;
        font-size: 1.5rem;
        border-radius: 0px;
      }

      .widget-title > button {
        font-size: 1rem;
        color: @text-color;
        text-shadow: none;
        background: @noti-bg;
        box-shadow: none;
        border: 1px solid @text-color;
        border-radius: 0px;
      }

      .widget-title > button:hover {
        background: #4c7899;
        border: 1px solid @bg-selected;
        color: @cc-bg;
      }

      .widget-dnd {
        /*background: @noti-bg-darker;*/
        background: transparent;
        border-bottom: 1px solid #93a1a1;
        padding: 10px 5px 10px 5px;
        margin: 5px 10px 5px 10px;
        border-radius: 0px;
        font-size: large;
        color: #93a1a1;
      }

      .widget-dnd > switch {
        border-radius: 0px;
        background: #665c54;
      }

      .widget-dnd > switch:checked {
        background: #4c7899;
        border: 1px solid #4c7899;
      }

      .widget-dnd > switch slider {
        background: @cc-bg;
        border-radius: 0px;
      }

      .widget-dnd > switch:checked slider {
        background: @cc-bg;
        border-radius: 0px;
      }

      .widget-label {
        margin: 10px 10px 5px 10px;
        background: transparent;
        border: 2px solid #93a1a1;
      }

      .widget-label > label {
        font-size: 1rem;
        color: @text-color;
      }

      .widget-mpris {
        color: @text-color;
        background: @cc-bg;
        border-top: 1px solid #93a1a1;
        padding: 10px 5px 0px 5px;
        margin: 0px 10px 0px 10px;
        border-radius: 0px;
      }

      .widget-mpris > box > button {
        border-radius: 0px;
      }

      .widget-mpris-player {
        padding: 5px 10px;
        margin: 10px;
      }

      .widget-mpris-title {
        font-weight: 700;
        font-size: 1.25rem;
      }

      .widget-mpris-subtitle {
        font-size: 1.1rem;
      }

      .widget-volume {
        color: @text-color;
        /*background: @noti-bg-darker;*/
        background: transparent;
        border-top: 1px solid #93a1a1;
        padding: 5px 10px 0px 10px;
        margin: 0px 10px 5px 10px;
        border-radius: 0px;
      }

    '';
  };
}
