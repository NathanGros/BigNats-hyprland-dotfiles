return {
      'VonHeikemen/fine-cmdline.nvim',
      dependencies = {
            'MunifTanjim/nui.nvim'
      },
      config = function()
            require('fine-cmdline').setup({
                  cmdline = {
                        prompt = ' '
                  }
            })
      end
}
