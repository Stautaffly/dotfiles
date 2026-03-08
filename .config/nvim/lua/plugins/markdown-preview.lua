-- markdown-preview.nvim configuration
-- Provides live browser preview for Markdown files
-- REQUIREMENTS: Node.js or Bun must be installed for the plugin to work
-- The plugin will auto-install its Node dependencies on first run

return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      -- Auto-start preview when opening markdown file (0 = disabled, 1 = enabled)
      vim.g.mkdp_auto_start = 0

      -- Auto-close preview when switching buffers (0 = disabled, 1 = enabled)
      vim.g.mkdp_auto_close = 1

      -- Refresh mode: 0 = auto on change, 1 = slow refresh, 2 = manual only
      vim.g.mkdp_refresh_slow = 0

      -- Allow markdown preview command in any buffer type
      vim.g.mkdp_command_for_global = 0

      -- Open preview to the world (0 = localhost only, 1 = any IP)
      vim.g.mkdp_open_to_the_world = 0

      -- Custom IP to open preview (empty = localhost)
      vim.g.mkdp_open_ip = ""

      -- Browser to open preview (empty = system default)
      -- Examples: "google-chrome", "firefox", "safari", "chromium"
      vim.g.mkdp_browser = ""

      -- Echo preview URL in command line
      vim.g.mkdp_echo_preview_url = 0

      -- Preview theme: "dark" or "light"
      vim.g.mkdp_theme = "dark"

      -- Preview page title format
      vim.g.mkdp_page_title = "${name} - Preview"

      -- Recognized filetypes for markdown preview
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreview<CR>", desc = "Markdown Preview" },
      { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", desc = "Stop Markdown Preview" },
      { "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
    },
    ft = { "markdown" },
  },
}
