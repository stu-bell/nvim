# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# Plugins
https://www.lazyvim.org/configuration/plugins

## Add plugins

Adding a plugin is as simple as adding the plugin spec to one of the files under lua/plugins/\*.lua. You can create as many files there as you want.
You can structure your lua/plugins folder with a file per plugin, or a separate file containing all the plugin specs for some functionality.
Config objects must start with a `return` statement

## Disable plugins

In any file in lua, eg  `lua/plugins/disabled.lua`

```
return {
  -- disable trouble
  { "nvim-treesitter", enabled = false },
  { "nvim-ts-autotag", enabled = false },
  { "nvim-treesitter-context", enabled = false },
  { "mason-lspconfig", enabled = false },
  { "mason", enabled = false },
}
```
