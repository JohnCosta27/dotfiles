# Nvim config

I use [NvChad](https://nvchad.com/) as the base of my config, with some custom plugins and key mappings, as well as language servers. I haven't tested this config on other machines except my own so your experience may vary.

* NvChad switched to Mason to manage Lsps so you will need to install the ones you want.
* TreeSitter for syntax highlighting, doesn't automatically install new languages, so you have to do this yourself.

To use my NvChad config, take the files inside `nvchad`, and copy them inside `~/.config/nvim/lua/custom`, a folder NvChad uses for custom configurations.
