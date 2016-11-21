#THIS IS AUTOMATED:

Mate 1.17 does not even really exist. At the time of writting only 6 packages are updated.

Use with care

Again this is on a cronjob. If there is any issue please inform me.

# arch_mate
PKGBUILD's for MATE in Arch Linux's

You can install everything with mate-meta-dev package from the aur but that is the development -old- branch.

Currently there is no gtk 3.22 on official repos, so wait for that.

Features:

<<<<<<< HEAD
* Updated to latest development upstream:  1.17.x 
=======
* Updated to latest development upstream:  1.16.x 
>>>>>>> 129eec30da3e0c00f59c10f4cd0db0ffb85bfbe9
* GTK3 PKGBUILDs only
* Build test all packages. The current methodology is to run them in my main machine as my daily driver.

Known Issues (things i removed from orginal community branch): 

* cannot make mate-sensors-applet as it needs a nvidia package.
* mate-netbook has never worked for me.
* cannot make mate-indicator-applet because arch/aur lacks libido3

This is currently updated with a cron job (with the script ./update.sh) on a 6 hour basis, every 12 am and pm local Greece time (with daylight savings when applicable).
