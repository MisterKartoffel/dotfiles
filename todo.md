
# ▀█▀ █▀█ █▀▄ █▀█
# ░█░ █▄█ █▄▀ █▄█

# Completed {{{
- [x] Fix GRUB menu not showing {{{
Steps:
1. Run `videoinfo` in the GRUB terminal, see no output
2. Change `GRUB_TERMINAL_OUTPUT` to `console`
3. Also changed `GRUB_TIMEOUT_STYLE` to `hidden` }}}

- [x] Learn how to set default applications through the XDG MIME Standard {{{
Steps:
1. Realize it's done by default. }}}
# }}}

# Essentials
- [ ] Move all themes to $HOME/{.themes,.icons}

- [ ] Change kernels to Zen and LTS {{{
    - [ ] Expand boot partition to 1G
    - [ ] Download:
        - [ ] Linux-LTS
        - [ ] Linux-LTS-headers
        - [ ] Linux-Zen
        - [ ] Linux-Zen-headers
    - [ ] Update the following GRUB configuration in /etc/default/grub:
        - [ ] GRUB_SAVEDEFAULT=true
        - [ ] GRUB_DEFAULT=saved
    - [ ] Run sudo grub-mkconfig -o /boot/grub/grub.cfg
    - [ ] Reboot into Zen kernel
    - [ ] Uninstall default kernel
    - [ ] Run sudo /etc/grub.d/41_snapshots-btrfs
    - [ ] Run sudo grub-mkconfig -o /boot/grub/grub.cfg
    - [ ] Reboot }}}

# Non-essentials {{{
- [ ] Set up Neovim to work with LaTeX files

- [ ] Fix Treesitter not working with hyprland files

- [ ] Move local password database from Bitwarden-CLI to GNU Pass

- [ ] Start coding widgets in AGS
# }}}
