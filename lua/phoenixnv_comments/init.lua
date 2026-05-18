local M = {}

-- Toggle comment for the current line (preserves indentation)
function M.toggle_line()
  local line = vim.api.nvim_get_current_line()

  if line:match("^%s*//") then
    -- Uncomment: keep indentation
    local uncommented = line:gsub("^(%s*)//%s?", "%1", 1)
    vim.api.nvim_set_current_line(uncommented)
  else
    -- Comment: insert // after indentation
    local indent = line:match("^(%s*)")
    local commented = indent .. "// " .. line:sub(#indent + 1)
    vim.api.nvim_set_current_line(commented)
  end
end

-- Toggle comment for a visual selection (correct selection handling)
function M.toggle_visual()
  -- REAL visual selection (not '< and '>)
  local start_pos = vim.fn.getpos("v")[2]
  local end_pos   = vim.fn.getpos(".")[2]

  if start_pos > end_pos then
    start_pos, end_pos = end_pos, start_pos
  end

  -- Check if all lines are commented
  local all_commented = true
  for lnum = start_pos, end_pos do
    local line = vim.fn.getline(lnum)
    if not line:match("^%s*//") then
      all_commented = false
      break
    end
  end

  -- Apply comment or uncomment
  for lnum = start_pos, end_pos do
    local line = vim.fn.getline(lnum)

    if all_commented then
      -- Uncomment
      local uncommented = line:gsub("^(%s*)//%s?", "%1", 1)
      vim.fn.setline(lnum, uncommented)
    else
      -- Comment
      local indent = line:match("^(%s*)")
      local commented = indent .. "// " .. line:sub(#indent + 1)
      vim.fn.setline(lnum, commented)
    end
  end
end

-- Setup keymaps
function M.setup(opts)
  opts = opts or {}

  local key = opts.key or "<C-_>"  -- Ctrl+/

  -- Normal mode
  vim.keymap.set("n", key, M.toggle_line, { noremap = true, silent = true })

  -- Visual mode (IMPORTANT FIX)
  vim.keymap.set("x", key, function()
    M.toggle_visual()
  end, { noremap = true, silent = true })
end

return M

