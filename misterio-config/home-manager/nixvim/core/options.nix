{ pkgs,  ... }: {
  config = {
    options = {
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
  };
}
