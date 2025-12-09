vim.filetype.add {
  pattern = {
    ['.*'] = {
      priority = math.huge,
      function(path, bufnr)
        local line1 = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
        local line2 = vim.api.nvim_buf_get_lines(bufnr, 1, 2, false)[1]
        if vim.regex([[^AWSTemplateFormatVersion]]):match_str(line1) ~= nil or vim.regex([[^AWSTemplateFormatVersion]]):match_str(line2) ~= nil then
          return 'yaml.cloudformation'
        elseif vim.regex([[["']AWSTemplateFormatVersion]]):match_str(line1) ~= nill or vim.regex([[["']AWSTemplateFormatVersion]]):match_str(line2) ~= nil then
          return 'json.cloudformation'
        end
      end,
    },
  },
}

vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.yaml,*.yml",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "shiftwidth", 2)
      vim.api.nvim_buf_set_option(buf, "softtabstop", 2)
      vim.api.nvim_buf_set_option(buf, "expandtab", true)
      vim.opt_local.indentkeys:remove('0#')
      vim.opt_local.indentkeys:remove('<:>')
    end
  }
)
