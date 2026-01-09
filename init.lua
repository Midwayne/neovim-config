-- Bootstrap lazy.nvim first
require 'bootstrap'

-- Load configuration modules
require 'options'
require 'keymaps'
require 'autocmds'

-- Load plugins (this will call lazy.setup)
require 'plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
