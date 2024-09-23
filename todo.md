
# ▀█▀ █▀█ █▀▄ █▀█
# ░█░ █▄█ █▄▀ █▄█

# Completed {{{
## Essentials
- [x] Fix GRUB menu not showing {{{
Steps:
1. Run `videoinfo` in the GRUB terminal, see no output.
2. Change `GRUB_TERMINAL_OUTPUT` to `console`
3. Also changed `GRUB_TIMEOUT_STYLE` to `hidden` }}}

- [x] Learn how to set default applications through the XDG MIME Standard {{{
Steps:
1. Realize it's done by default. }}}

- [x] Download fallback kernel (LTS) {{{
Steps:
1. Download GParted live ISO.
2. Shrink `/dev/sda2` by 768MiB (1024MiB - 256MiB).
3. Move `/dev/sda2` to the end of the disk.
4. Resize `/dev/sda1` to 1GiB.
5. Resize FAT32 filesystem in `/dev/sda1` to 1GiB.
6. ERROR: No tool currently available can resize a FAT32 filesystem that is 256MiB or smaller.
6.1. In GParted, reformat `/dev/sda1` to ext4, resize to 1GiB, reformat to FAT32.
6.2. Boot Arch Linux live installation media.
6.3. Mount root subvolume with `mount /dev/sda2 /mnt`
6.4. Restore `/boot` backup from `/.bootbackup/*`
7. Reboot, system update, reinstall and reconfigure GRUB for good measure. }}}

- [x] Enable swap on zram {{{
Steps:
1. Explicitly loaded zram module at boot in `/etc/modules-load.d/zram.conf`
2. Created udev rule at `/etc/udev/rules.d/99-zram.rules`
3. Added `/dev/zram0` line to `/etc/fstab`
4. Added zram parameters at `/etc/sysctl.d/99-vm-zram-parameters.conf`
5. Disabled zswap with kernel parameter `zswap.enabled=0` in GRUB.
6. Rebooted.
Notes:
1. Check zram operating status with `zramctl`
}}}

## Non-essentials
- [x] Move local password database from Bitwarden-CLI to GNU Pass {{{
Steps:
1. Set up `$HOME/.password-store` with GPG key 0EF2E1E3DA549C4DC22134732DA35B0FC0530576 (felipesdrs@hotmail.com).
2. Imported Bitwarden vault with pass-import's `pass import bitwarden <file>.json`
3. Deleted `<file>.json`
4. Uninstalled pass-import.
5. To set up pass-tomb:
5.1 Moved `$HOME/.password-store` to `$HOME/.password-store.bak`
5.2 Initialized password tomb with GPG key 0EF2E1E3DA549C4DC22134732DA35B0FC0530576 (felipesdrs@hotmail.com).
5.3 Opened tomb with `pass open` and moved `$HOME/.password-store.bak` to `$HOME/.password-store` }}}
# }}}

# Essentials
- [ ] Move all themes to `$HOME/{.themes,.icons}`

# Non-essentials {{{
- [ ] Set up Neovim to work with LaTeX files.

- [ ] Fix Treesitter not working with hyprland files.

- [ ] Start coding widgets in AGS.
# }}}
