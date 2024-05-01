{inputs, pkgs, ... } : {

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ./core
  ./plugins
  ];

  programs.nixvim = {
    enable = false;
    enableMan = true; # install man pages for nixvim options

      clipboard.register = "unnamedplus"; # use system clipboard instead of internal registers

        colorschemes = {
          # rose-pine = {
          #  enable = true;
          # };

          gruvbox = {
             enable = true;
             };
        };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      wrap = true;
      linebreak = true; 
      ignorecase = true;
      smartcase = true; 
      cursorline = true;
      hlsearch = false; 
      incsearch = true; 
# backspace = "indent, eol, start";
      splitright = true; 
      splitbelow = true;
      swapfile = false;
      backup = false;
    };


    keymaps = [
    {
      action = "h"; key = "m";
    }  {
      action = "j"; key = "n";
    }  {
      action = "k"; key = "e";
    }  {
      action = "l"; key = "i";
      mode = ["n" "v"];
    }

    {
      action = "H"; key = "M";
    }  {
      action = "J"; key = "N";
    } {
      action = "K"; key = "E";
    }  {
      action = "L"; key = "I";
      mode = ["n" "v"];
    }

    {
      action = "m"; key = "h";
    }  {
      action = "n"; key = "j";
    }  {
      action = "e"; key = "k";
    }  {
      action = "i"; key = "l";
      mode = ["n" "v"];
    }

    {
      action = "M"; key = "H";
    }  {
      action = "N"; key = "J";
    }  {
      action = "E"; key = "K";
    }  {
      action = "I"; key = "L";
      mode = ["n" "v"];
    }

    ];

  };
  programs.nixvim.globals.mapleader = " ";
}
