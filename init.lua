-- Bootstrap lazy.nvim first
require 'kickstart.lazy'

-- Load configuration modules
require 'kickstart.options'
require 'kickstart.keymaps'
require 'kickstart.autocmds'

-- Load plugins (this will call lazy.setup)
require 'kickstart.plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
