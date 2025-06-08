neoscroll = require('neoscroll')

local keymap = {
  ["<CA-Up>"] = function() neoscroll.ctrl_u({ duration = 250 }) end;
  ["<CA-Down>"] = function() neoscroll.ctrl_d({ duration = 250 }) end;
  ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450 }) end;
  ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450 }) end;
  ["<C-Up>"] = function() neoscroll.scroll(-0.1, { move_cursor=true; duration = 100 }) end;
  ["<C-Down>"] = function() neoscroll.scroll(0.1, { move_cursor=true; duration = 100 }) end;
  ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end;
  ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end;
  ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end;
}

local modes = { 'n', 'v', 'x' }

for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
