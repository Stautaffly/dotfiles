# Neovim Production Configuration

A production-ready Neovim setup based on [LazyVim](https://lazyvim.github.io/) with Python development tools, Jupyter integration, and Markdown support.

## Features

- **LazyVim Framework** - Modern Neovim configuration with plugin management via [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Python LSP** - [Ruff](https://docs.astral.sh/ruff/) for fast linting/formatting + [Pyright/basedpyright](https://github.com/detachhead/basedpyright) for type checking
- **Jupyter Integration** - [molten-nvim](https://github.com/benlubas/molten-nvim) for running Python code in Jupyter notebooks
- **Markdown Tools** - Preview and render Markdown files with [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) and [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- **Tokyo Night Theme** - Beautiful dark theme with syntax highlighting

## Prerequisites

- **Neovim 0.9+** - [Install](https://github.com/neovim/neovim/releases)
- **Git** - For cloning and plugin management
- **Node.js** or **Bun** - For markdown-preview and some plugins
- **Python 3.8+** - For Python LSP and Jupyter integration
- **Nerd Font** - For icons (recommended: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads))

## Installation

### 1. Backup Existing Configuration

```bash
# Backup existing nvim config if it exists
mv ~/.config/nvim ~/.config/nvim.bak
```

### 2. Clone This Repository

```bash
git clone https://github.com/your-repo/nvim-config.git ~/.config/nvim
```

### 3. Install Plugins

1. Open Neovim:
   ```bash
   nvim
   ```

2. Wait for lazy.nvim to automatically install all plugins
3. Restart Neovim when installation completes

### 4. Install LSP Servers

Open Neovim and run:

```bash
:Mason
```

Install the following via Mason:
- `ruff-lsp` (Python linting)
- `basedpyright` or `pyright` (Python type checking)
- `prettier` (Markdown formatting)

### 5. Install Python Dependencies

```bash
# Core dependencies
pip install pynvim jupyter-client ipykernel

# Or use uv (faster)
uv pip install pynvim jupyter-client ipykernel
```

### 6. Configure Python Path (if needed)

If Neovim can't find Python, add to your shell config:

```bash
# In ~/.bashrc or ~/.zshrc
export PATH="$HOME/.local/bin:$PATH"
```

Verify with:
```bash
:lua print(vim.fn.exepath('python3'))
```

## Python Setup

### Virtual Environment (Recommended)

For each project, create a virtual environment:

```bash
cd your-project/
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install pynvim jupyter-client ipykernel
python -m ipykernel install --user --name=your-project
```

### Initialize Molten

Before running Jupyter cells, initialize the kernel:

```bash
# In Neovim with a Python file open
:MoltenInit python3
```

Or use the keymap: `<leader>ji`

## Keymaps

### General (LazyVim Defaults)

| Keymap | Description |
|--------|-------------|
| `<leader>` | Space, the leader key |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffer list |
| `<leader>fh` | Help tags |
| `<leader>w` | Save file |
| `<leader>q` | Quit |

See [LazyVim Keymaps](https://lazyvim.github.io/keymaps) for full list.

### Python (`<leader>p`)

| Keymap | Description |
|--------|-------------|
| `<leader>pr` | Organize Imports |
| `<leader>pf` | Format with Ruff |

### Jupyter (`<leader>j`)

| Keymap | Description |
|--------|-------------|
| `<leader>ji` | Initialize Molten |
| `<leader>jr` | Run cell |
| `<leader>jR` | Re-run current cell |
| `<leader>ja` | Re-evaluate all cells |
| `<leader>jo` | Show output |
| `<leader>jh` | Hide output |
| `<leader>jd` | Delete cell |
| `<leader>jn` | Next cell |
| `<leader>jp` | Previous cell |

**Cell Markers:**
- `# %%` (Spyder-style)
- `# %% [markdown]` (Markdown cells)
- `# <codecell>` (IPython-style)

### Markdown (`<leader>m`)

| Keymap | Description |
|--------|-------------|
| `<leader>mp` | Start preview |
| `<leader>ms` | Stop preview |
| `<leader>mt` | Toggle preview |
| `<leader>mr` | Toggle render |

## Troubleshooting

### Plugin Installation Fails

```bash
# Clear lazy cache and retry
rm -rf ~/.local/share/nvim/lazy
nvim +Lazy! sync
```

### Python LSP Not Working

1. Check if basedpyright is installed:
   ```bash
   :LspInfo
   ```

2. Install via Mason:
   ```bash
   :Mason
   ```

3. Or install manually:
   ```bash
   pip install basedpyright
   ```

### Molten/Jupyter Not Working

1. **Verify Python path:**
   ```bash
   :lua print(vim.fn.exepath('python3'))
   ```

2. **Update remote plugins:**
   ```bash
   :UpdateRemotePlugins
   # Restart Neovim after this command
   ```

3. **Check kernel is registered:**
   ```bash
   jupyter kernelspec list
   ```

4. **Install kernel explicitly:**
   ```bash
   python -m ipykernel install --user --name=myenv
   ```

5. **Initialize with specific kernel:**
   ```bash
   :MoltenInit python3
   ```

### Markdown Preview Not Opening

1. **Install Node.js/Bun** - Required for markdown-preview
2. **Install prettier** via Mason:
   ```bash
   :Mason
   ```
3. **Check browser** - Preview opens in default browser

### Tokyo Night Theme Not Loading

The theme should load automatically. If not:

```lua
-- Add to ~/.config/nvim/lua/config/options.lua
vim.opt.termguicolors = true
```

### Slow Startup

1. Check plugin load times:
   ```bash
   :StartupTime
   ```

2. Disable unnecessary plugins in `lua/plugins/`

## Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Molten.nvim](https://github.com/benlubas/molten-nvim)
- [Ruff](https://docs.astral.sh/ruff/)
- [basedpyright](https://github.com/detachhead/basedpyright)

## License

See [LICENSE](./LICENSE) for details.
