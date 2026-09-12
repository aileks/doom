# Doom Emacs Config

My personal [Doom Emacs](https://github.com/doomemacs/doomemacs) configuration.

## Highlights

- Evil with `jk` escape
- Corfu + Vertico completion
- LSP and Tree-sitter for C/C++, JSON, Lua, Python, YAML, and Zig
- Org workflow customizations
- SQL and dbt helpers
- Project task navigation
- Debug-print helpers
- [cinder-grove](https://github.com/aileks/cinder-grove.el) theme

## Install

```sh
git clone https://github.com/aileks/doom ~/.config/doom
doom sync # if doom is in path
```

## Custom Keybinds

| Key               | Does                                                      |
| ----------------- | --------------------------------------------------------- |
| `jk`              | Esc                                                       |
| `SPC f t`         | Search TODO/NEXT/WAIT/FIXME-style comments in the project |
| `SPC p t`         | Project task menu                                         |
| `SPC c p v` / `V` | Debug print variable below/above                          |
| `SPC c p e` / `E` | Debug print expression below/above                        |
| `SPC c p p` / `P` | Debug print file:line below/above                         |
| `SPC c p c`       | Remove all DBG: prints in buffer                          |
