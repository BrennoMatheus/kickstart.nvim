vim.pack.add {
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' }
}

local harpoon = require 'harpoon'

harpoon:setup()

vim.keymap.set('n', '<leader>ha', function()
    harpoon:list():add()
end)
vim.keymap.set('n', '<leader>he', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', "<leader>'a", function()
    harpoon:list():select(1)
end)

vim.keymap.set('n', "<leader>'s", function()
    harpoon:list():select(2)
end)

vim.keymap.set('n', "<leader>'d", function()
    harpoon:list():select(3)
end)

vim.keymap.set('n', "<leader>'f", function()
    harpoon:list():select(4)
end)

vim.keymap.set('n', '<C-S-P>', function()
    harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
    harpoon:list():next()
end)

-- return {
--     'ThePrimeagen/harpoon',
--     branch = 'harpoon2',
--     dependencies = { 'nvim-lua/plenary.nvim' },
--     opts = {},
--     config = function()
--         local harpoon = require 'harpoon'
--
--         -- REQUIRED
--         harpoon:setup()
--         -- REQUIRED
--
--         vim.keymap.set('n', '<leader>a', function()
--             harpoon:list():add()
--         end)
--         vim.keymap.set('n', '<C-e>', function()
--             harpoon.ui:toggle_quick_menu(harpoon:list())
--         end)
--
--         vim.keymap.set('n', "<leader>'a", function()
--             harpoon:list():select(1)
--         end)
--         vim.keymap.set('n', "<leader>'s", function()
--             harpoon:list():select(2)
--         end)
--         vim.keymap.set('n', "<leader>'d", function()
--             harpoon:list():select(3)
--         end)
--         vim.keymap.set('n', "<leader>'f", function()
--             harpoon:list():select(4)
--         end)
--
--         -- Toggle previous & next buffers stored within Harpoon list
--         vim.keymap.set('n', '<C-S-P>', function()
--             harpoon:list():prev()
--         end)
--         vim.keymap.set('n', '<C-S-N>', function()
--             harpoon:list():next()
--         end)
--     end,
-- }
