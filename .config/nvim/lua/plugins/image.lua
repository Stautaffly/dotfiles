return {
  {
    "3rd/image.nvim",
    -- Only enable if terminal supports image rendering
    enabled = function()
      -- Check for Kitty terminal (best support)
      if vim.env.KITTY_WINDOW_ID then
        return true
      end
      -- Check for WezTerm
      if vim.env.WEZTERM_EXECUTABLE then
        return true
      end
      -- Check for Ghostty
      if vim.env.GHOSTTY_RESOURCES_DIR then
        return true
      end
      -- Check for Alacritty with proper backend
      if vim.env.ALACRITTY_SOCKET or vim.env.ALACRITTY_LOG then
        return true
      end
      -- Check for tmux with Kitty passthrough (advanced)
      if vim.env.TMUX and vim.env.TERM == "xterm-kitty" then
        return true
      end
      -- Fallback: check if running in a known image-capable environment
      -- via TERM_PROGRAM for iTerm2 (macOS)
      if vim.env.TERM_PROGRAM == "iTerm.app" then
        return true
      end

      -- Disable for unsupported terminals
      return false
    end,
    opts = function()
      -- Auto-detect the best backend
      local function detect_backend()
        -- Kitty terminal has native graphics protocol support
        if vim.env.KITTY_WINDOW_ID then
          return "kitty"
        end
        -- Ghostty supports the Kitty graphics protocol
        if vim.env.GHOSTTY_RESOURCES_DIR then
          return "kitty"
        end
        -- WezTerm also supports the Kitty graphics protocol
        if vim.env.WEZTERM_EXECUTABLE then
          return "kitty"
        end
        -- Alacritty needs ueberzug or similar
        if vim.env.ALACRITTY_SOCKET or vim.env.ALACRITTY_LOG then
          return "kitty" -- Modern Alacritty supports Kitty protocol
        end
        -- iTerm2 has its own protocol (falls back to base64 inline)
        if vim.env.TERM_PROGRAM == "iTerm.app" then
          return "kitty" -- image.nvim handles iTerm2 internally
        end
        -- Default fallback
        return "kitty"
      end

      return {
        backend = detect_backend(),
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" },
          },
          neorg = {
            enabled = false,
          },
        },
        max_width = 100,
        max_height = 12,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = false,
        editor_only_render_when_focused = false,
        tmux_show_only_in_active_window = false,
      }
    end,
  },
}
