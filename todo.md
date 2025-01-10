
# ▀█▀ █▀█ █▀▄ █▀█
# ░█░ █▄█ █▄▀ █▄█


# TODO
## Essentials
- [ ] Configure all custom channels in Television
- [ ] Configure Telescope

## Non-essentials
- [ ] Set up Neovim to work with LaTeX files.
- [ ] Fix Treesitter not working with hyprland files.
- [ ] Look into if Syncthing is a good addition.

# Completed
## Essentials
- [x] Migrate to rEFInd from GRUB
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
11. Added upgrade pacman hook at `/etc/pacman.d/hooks/99-refind.hook`

- [x] Enable zswap with `/swap/swapfile`
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
13. Edited `/etc/fstab` by appending `/swap/swapfile none swap defaults 0 0`

- [x] Fix audio popping when booting up
Steps:
1. Added `options snd_hda_intel power_save=0 power_save_controller=N` to `/etc/modprobe.d/snd_hda_intel.conf`
2. Added `options snd_ac97_codec power_save=0` to `/etc/modprobe.d/snd_ac97_codec.conf`
3. Added `/etc/wireplumber/wireplumber.conf.d/51-disable-suspension.conf`

## Non-essentials
- [x] Disabled watchdogs
Steps:
1. Added `nowatchdog` to kernel parameters.
2. Added `blacklist iTCO_wdt` to `/etc/modprobe.d/disable-iTCO_wdt.conf`
