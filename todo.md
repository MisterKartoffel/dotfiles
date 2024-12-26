
# ▀█▀ █▀█ █▀▄ █▀█
# ░█░ █▄█ █▄▀ █▄█


# Essentials

# Non-essentials {{{
- [ ] Fix Waybar weather widget.
- [ ] Set up Neovim to work with LaTeX files.
- [ ] Fix Treesitter not working with hyprland files.
- [ ] Look into if Syncthing is a good addition.
# }}}

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
1. Check zram operating status with `zramctl` }}}

- [x] Migrate to rEFInd from GRUB {{{
Steps:
1. Installed package `refind`
2. Ran script `refind-install --usedefault /dev/sda1 --alldrivers`
3. Configured and confirmed working manual boot stanzas in `/boot/EFI/BOOT/refind.conf`
4. Deleted all other entries from `efibootmgr`
5. Deleted `/boot/EFI/grub` and `/boot/grub`
6. Deleted `grub-overlay-btrfs` from `/etc/initcpio/hooks/` and `/etc/initcpio/install/`
7. As per (6), removed `grub-overlay-btrfs` HOOK from `/etc/mkinitcpio.conf` and ran `mkinitcpio -P`
8. Uninstalled `grub` and `grub-btrfs`
9. Installed, configured `refind-btrfs` and enabled `refind-btrfs.service`
10. Installed `Shell.efi`, `gdisk_x64.efi` and `memtest86-usb.img` to `/boot/EFI/tools`
11. Added upgrade pacman hook at `/etc/pacman.d/hooks/99-refind.hook` }}}

- [x] Enable zswap with `/swap/swapfile` {{{
Steps:
1. Rebooted into Arch live ISO.
2. Mounted BTRFS `FS_TREE` with `mount /dev/sda2 /mnt -o subvolid=5`
3. Created subvolumes `@var` and `@swap`
4. Moved old `/var` contents with `cp -r --archive --reflink=always /mnt/@/var/* /mnt/@var`
5. Mounted `@var` and `@swap` to `/mnt/var` and `/mnt/swap`, respectively.
6. Regenerated `/etc/fstab` with `genfstab -U /mnt > /mnt/etc/fstab`
7. Rebooted into system.
8. Recreated broken symlinks `@var/run` and `@var/lock` with `ln -s /run /var/run` and `ln -s /var/run /var/lock`
9. Deleted all previous snapshots in `/.snapshots`
10. Regenerated rEFInd's snapshot stanzas.
11. Created `/swap/swapfile` with `sudo btrfs filesystem mkswapfile --size 8g --uuid clear /swap/swapfile`
12. Disabled zram by undoing zram steps 1..5.
13. Edited `/etc/fstab` by appending `/swap/swapfile none swap defaults 0 0` }}}

- [x] Fix audio popping when booting up {{{
Steps:
1. Added `options snd_hda_intel power_save=0 power_save_controller=N` to `/etc/modprobe.d/snd_hda_intel.conf`
2. Added `options snd_ac97_codec power_save=0` to `/etc/modprobe.d/snd_ac97_codec.conf`
3. Added `/etc/wireplumber/wireplumber.conf.d/51-disable-suspension.conf` }}}

- [x] Move all theme-related files to `$HOME/.local/share/themes` {{{
Steps:
1. Deleted unnecessary externally installed theme files.
2. Moved and reconfigured all theme engines (QT5 and QT6 through Kvantum, GTK through nwg-look).
3. Kept GTK theme under `$HOME/.themes` for Flatpak compatibility. }}}

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

- [x] Disabled watchdogs {{{
Steps:
1. Added `nowatchdog` to kernel parameters.
2. Added `blacklist iTCO_wdt` to `/etc/modprobe.d/disable-iTCO_wdt.conf` }}}
# }}}
