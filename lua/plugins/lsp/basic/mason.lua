






return {
  {'williamboman/mason.nvim',
  

  
  
  
  event = "VimEnter", 

  
  config = function()
    require('mason').setup({
      
      
      automatic_installation = true,

      
      auto_clean = true,
      
      log_level = vim.log.levels.INFO,

      
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      
    })
    print("Mason.nvim setup completed.") 
  end,

  },
  {
    'williamboman/mason-lspconfig.nvim',
    
    dependencies = { 'williamboman/mason.nvim' },

    
    
    event = "VimEnter",

    
    config = function()
    require('mason-lspconfig').setup({
      
      
      automatic_installation = true,

      
      
      ensure_installed = {
        "lua_ls",         
        
      },
      
      setup_handlers = {
        
        
        function(server_name)
        require('lspconfig')[server_name].setup({}) 
        
        end,
      },

      
      
    })
    end,
  },
}
