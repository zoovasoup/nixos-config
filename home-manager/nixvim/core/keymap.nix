{ ... } : {
  programs.nixvim.keymaps = [
  { action = ":nohl<CR>"; key = "<leader>nh"; }

  #{ action = '"_x"'; key = "x"; }

  { action = ":Oil<CR>"; key = "<leader>pv"; } # -- increment
  # -- increment/decrement numbers
  { action = "<C-a>"; key = "<leader>+"; } # -- increment
  { action = "<C-x>"; key = "<leader>-"; } # -- decrement

  # -- window management
  { action = "<C-w>v"; key = "<leader>sv"; } # -- split window vertically
  { action = "<C-w>s"; key = "<leader>sh"; } # -- split window horizontally
  { action = "<C-w>="; key = "<leader>se"; } # -- make split windows equal width & height
  { action = "<cmd>close<CR>"; key = "<leader>sx"; } # -- close current split window
  { action = "<cmd>tabnew<CR>"; key = "<leader>to"; } # -- open new tab
  { action = "<cmd>tabclose<CR>"; key = "<leader>tx"; } # -- close current tab
  { action = "<cmd>tabn<CR>"; key = "<leader>tn"; } # --  go to next tab
  { action = "<cmd>tabp<CR>"; key = "<leader>tp"; } # --  go to previous tab
  { action = "<cmd>tabnew %<CR>"; key = "<leader>tf"; } # --  move current buffer to new tab

  # -- buffer management
  { action = ":bd<CR>"; key = "<leader>bd"; } # -- close current buffer
  { action = ":bn<CR>"; key = "<leader>bn"; } # --  go to next buffer
  { action = ":bp<CR>"; key = "<leader>bp"; } # --  go to previous buffer

  # -- buffer navigation
  { action = "<C-w>h"; key = "<leader>wm"; }
  { action = "<C-w>l"; key = "<leader>wn"; }
  { action = "<C-w>j"; key = "<leader>we"; }
  { action = "<C-w>k"; key = "<leader>wi"; }

  # --buffer sizing
  { action = "<cmd>vertical resize +10<cr>"; key = "="; } # -- make the window biger vertically
  { action = "<cmd>vertical resize -10<cr>"; key = "-"; } # -- make the window smaller vertically
  { action = "<cmd>horizontal resize +5<cr>"; key = "+"; } # -- make the window bigger horizontally by pressing shift and =
  { action = "<cmd>horizontal resize -5<cr>"; key = "_"; } # -- make the window smaller horizontally by pressing shift and -

# { action = "" key = "" mode = "" }

  { action = ":m '>+1<CR>gv=gv"; key = "N"; mode = "v"; }
  { action = ":m '<-2<CR>gv=gv"; key = "E"; mode = "v"; }

  { action = "mzJ`z"; key = "N"; }
  { action = "<C-d>zz"; key = "<C-d>"; }
  { action = "<C-u>zz"; key = "<C-u>"; }
  { action = "nzzzv"; key = "k"; }
  { action = "Nzzzv"; key = "K"; }


  { action = "<cmd>cnext<CR>zz"; key = "<C-k>"; }
  { action = "<cmd>cprev<CR>zz"; key = "<C-j>"; }
  { action = "<cmd>lnext<CR>zz"; key = "<leader>k"; }
  { action = "<cmd>lprev<CR>zz"; key = "<leader>j"; }

  ];
}
