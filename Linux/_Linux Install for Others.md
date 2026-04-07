
If you want to install arch (since you probably want to install arch) you’re going to want to — at a high level — make a usb that has an arch iso (image), and setup arch within the usb image using an install script that graphically allows you to set up your OS

The image in usb part is pretty straight forward, but I like to use something called ventoy which allows you to store a bunch of images as well as being slightly nicer to set up as opposed to the traditional way of using something like rufus to directly put the image on the drive 
Setting up arch within the bootable iso is actually pretty easy thanks to an install script, the by-hand way is pretty unintuitive, and I would avoid it unless you have a very good reason to, since you’ll be dealing with really low level OS level stuff

I forgot the exact chain of commands, but you can boot into the install script with just one line, the install script is “archinstall” but I think you won’t have it on the image they serve by default, so you have to update something called the “package manager” which is pretty much the app store for linux distributions, arch’s package manager is called pacman

I’ll look up the command but it’s something like “pacman-keyring —init, pacman -Syu, archinstall”
You’ll need wifi too, use an ethernet cable preferably, but if you can’t then use iwctl (internet wireless ConTroL) to connect to internet, the official docs are pretty decent
There’s a small asterisk to the install script, it’ll try to by default coerce you to use a filesystem called BTRFS (butter filesystem) which is no problem in isolation, but the install script will also give you a popup to set up sub-volumes as you go through it, which also is not a problem, but the script is bugged or something last time I checked and can’t set up BTRFS Subvolumes properly and will just break, so simply press no to “set up subvolumes?) as you’re going through the script

I’ll look up the exact command once I get home but setting up the usb with ventoy is the first step, so don’t think you need to wait since you already have 99% of the information, and pop a steamos iso as well alongside arch iso on your ventoy in case you decide you don’t like arch or want to rollback to steamos mid install https://help.steampowered.com/en/faqs/view/65B4-2AA3-5F37-4227

good luck 

here's the command I mentioned to technically install arch linux in one command: pacman -Syu && pacman-key --init && pacman -S archlinux-keyring && archinstall

here's how to use iwctl to set up networking
iwctl
station device_name scan
station device_name get-networks
station device_name connect "nw"
station device_name show

and just one thing I forgot to mention, make sure you install iwd (the thing that iwctl controls) in the additional packages tab or you won't have wifi once you finish your install, and will have to boot back into a usb
