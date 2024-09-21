
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
6.3. Mount root subvolume with `mount /dev/sda2 /mnt`.
6.4. Restore `/boot` backup from `/.bootbackup/*`.
7. Reboot, system update, reinstall and reconfigure GRUB for good measure.
8. Created snapper snapshot #426. }}}

- [x] Enable swap on zram {{{
Steps:
1. Explicitly loaded zram module at boot in `/etc/modules-load.d/zram.conf`
2. Created udev rule at `/etc/udev/rules.d/99-zram.rules`
3. Added `/dev/zram0` to `/etc/fstab`
4. Rebooted.
Notes:
1. Check zram operating status with `zramctl`
}}}
# }}}

# Essentials
- [ ] Move all themes to `$HOME/{.themes,.icons}`

# Non-essentials {{{
- [ ] Set up Neovim to work with LaTeX files

- [ ] Fix Treesitter not working with hyprland files

- [ ] Move local password database from Bitwarden-CLI to GNU Pass

- [ ] Start coding widgets in AGS
# }}}
