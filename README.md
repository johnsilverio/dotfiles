# dotfiles

My terminal setup, versioned so a fresh machine is one command away from feeling like home. Fish, tmux, kitty, and Neovim, on Linux.

## What's inside

| tool | role | notes |
| --- | --- | --- |
| **fish** | shell | custom prompt and functions (`ll`, `ls`, `cat`, `grep`, `find`, `n`), plus `conf.d` drop-ins |
| **tmux** | multiplexer | plugins via TPM, session persistence with resurrect + continuum |
| **kitty** | terminal | JetBrainsMono Nerd Font, Adwaita-dark theme (others bundled in `themes/`) |
| **neovim** | editor | lives in its own repo, cloned by the installer |

## Requirements

- Linux (built on Fedora, nothing distro-specific)
- `git`, `fish`, `tmux`, `kitty`
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) for the icons and the prompt

## Install

```bash
git clone https://github.com/johnsilverio/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer symlinks each config into `~/.config`, clones the Neovim config from its own repo, and bootstraps TPM. Anything already in place is moved into `~/.config-backup-<timestamp>` before it's touched, and the script is safe to run more than once.

Then:

- open a new shell so fish picks up the config
- inside tmux, press `prefix + I` to fetch the plugins

## How it's wired

The real files live in this repo. The installer points `~/.config/<tool>` at them with symlinks, so editing a config here *is* editing the live one. No copying back and forth, no drift, and `git status` always tells the truth about what changed.

## What's deliberately not here

- `fish/fish_variables` — machine-local state fish rewrites on its own (paths, init flags)
- `tmux/plugins/` — fetched by TPM, not mine to version
- secrets — there are none in here, and `.gitignore` keeps it that way

## Neovim

The editor config is a separate repo: [johnsilverio/nvim](https://github.com/johnsilverio/nvim). Keeping it apart lets it move at its own pace; the installer just clones it into `~/.config/nvim`. To update it later, pull inside that directory.

## tmux plugins

Managed by [TPM](https://github.com/tmux-plugins/tpm): sensible, yank, resurrect, continuum, and vim-tmux-navigator. `prefix + I` installs, `prefix + U` updates.
