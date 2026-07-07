-- Bootstrap lazy.nvim first
require 'bootstrap'

-- Load configuration modules
require 'options'
require 'keymaps'
require 'autocmds'

-- Load plugins (this will call lazy.setup)
require 'plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=4 sts=4 sw=4 et
