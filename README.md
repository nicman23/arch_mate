#THIS IS AUTOMATED:

Mate 1.17 does not even really exist. At the time of writting only 6 packages are updated.

Use with care

Again this is on a cronjob. If there is any issue please inform me.

# arch_mate
PKGBUILD's for MATE in Arch Linux's

You can install everything with mate-meta-dev package from the aur.

Features:

<<<<<<< HEAD
* Updated to latest development upstream:  1.17.x 
=======
* GTK3 PKGBUILDs only

Known Issues (things i removed from orginal community branch): 

* cannot make mate-sensors-applet as it needs a nvidia package.
* mate-netbook has never worked for me.
* cannot make mate-indicator-applet because arch/aur lacks libido3

This is currently updated with a cron job (with the script ./update.sh) on a 6 hour basis, every 12 pm local Greece time (with daylight savings when applicable).
