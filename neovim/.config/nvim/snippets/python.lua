local ls = require("luasnip");
local s = ls.s
local t = ls.t

local d = ls.dynamic_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup('Python Snippets', { clear = true })
local file_pattern = '*.py'

local function cs(trigger, nodes, opts) --{{{
  local snippet = s(trigger, nodes)
  local target_table = snippets

  local pattern = file_pattern
  local keymaps = {}

  if opts ~= nil then
    -- check for custom pattern
    if opts.pattern then
      pattern = opts.pattern
    end

    -- if opts is a string
    if type(opts) == 'string' then
      if opts == 'auto' then
        target_table = autosnippets
      else
        table.insert(keymaps, { 'i', opts })
      end
    end

    -- if opts is a table
    if opts ~= nil and type(opts) == 'table' then
      for _, keymap in ipairs(opts) do
        if type(keymap) == 'string' then
          table.insert(keymaps, { 'i', keymap })
        else
          table.insert(keymaps, keymap)
        end
      end
    end

    -- set autocmd for each keymap
    if opts ~= 'auto' then
      for _, keymap in ipairs(keymaps) do
        vim.api.nvim_create_autocmd('BufEnter', {
          pattern = pattern,
          group = group,
          callback = function()
            vim.keymap.set(keymap[1], keymap[2], function()
              ls.snip_expand(snippet)
            end, { noremap = true, silent = true, buffer = true })
          end,
        })
      end
    end
  end

  table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

cs('pdb', fmt(-- prints in yellow font and black background
  [[
  __import__('pdb').set_trace() ##DELETEME
]] , {}))
local print_fmt_str = [[
    print("""{1} {2}:""")
    print({3})
    print('\x1b[0m')
    ]]


cs(-- for([%w_]+) emoji.log{{{
  { trig = "ptgre", regTrig = false },
  fmt(print_fmt_str,
    {
      d(1, function()
        return sn(1, t(emojis[math.random(#emojis)]))
      end),
      d(2, function(_, snip)
        local v = snip.env
        local my_clipboard = vim.fn.getreg('"', 1, true)[1]
        my_clipboard:gsub('%$', '')
        if string.match(my_clipboard, "'") then
          my_clipboard = my_clipboard:gsub("%'", '')
        end
        if string.match(my_clipboard, '"') then
          my_clipboard = my_clipboard:gsub('%"', '')
        end
        if string.match(my_clipboard, '`') then
          my_clipboard = my_clipboard:gsub('%`', '')
        end
        local ms = '  \\x1b[1;32;40m' .. v.TM_FILENAME .. ':' .. v.TM_LINE_NUMBER .. '\t'
        ms = ms .. my_clipboard
        return sn(1, t(ms))
      end),
      d(3, function()
        local my_clipboard = vim.fn.getreg('"', 1, true)[1]
        return sn(1, t(my_clipboard))
      end),
    }
  )
)
-- End Refactoring --

return snippets, autosnippets
