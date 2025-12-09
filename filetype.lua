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
