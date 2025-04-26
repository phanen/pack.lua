local target = arg[1]
local files = target and { target }
  or vim.fs.find(
    function(name) return name:match('%.lua$') end,
    { limit = math.huge, path = vim.fn.stdpath('config') }
  )

vim.g._ts_force_sync_parsing = true

for _, f in ipairs(files) do
  vim.cmd.edit(f)
  local q = vim.treesitter.query.parse('lua', [[(comment) @comment]])
  local p = assert(vim.treesitter.get_parser(0, 'lua', { error = false }))
  p:parse()
  for _, node in q:iter_captures(p:trees()[1]:root(), 0) do
    -- local capture_name = q.captures[id]
    local start_row, start_col, end_row, end_col = node:range()
    vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {})
  end
end

vim.cmd.wall()
