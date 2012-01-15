HTC Amaze 4g (GSM): Compile Evervolv (Linux)


How to compile Evervolv for Ruby (HTC Amaze 4g).
Prepare the Build Environment
NOTE: You only need to do these steps the first time you build. If you previously prepared your build environment, skip to Check for updates
Install the Build Packages
Install using the package manager of your choice:
For 32-bit & 64-bit systems:
sudo apt-get install git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs \
  x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev \
  libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown \
  libxml2-utils xsltproc

For 64-bit only systems:
sudo apt-get install git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs \
  x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev \
  libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown \
  libxml2-utils xsltproc

NOTE: On Ubuntu 11.10, and variants, you need to enable the parter repository to install sun-java6-jdk:

sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update
sudo apt-get install sun-java6-jdk

Create the Directories
You will need to set up some directories in your build environment.
To create them:
mkdir -p ~/bin
mkdir -p ~/android/evervolv
Install the Repository
Enter the following to download make executable the "repo" binary:
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo
NOTE: You may need to reboot for these changes to take effect.
Now enter the following to initialize the repository:
cd ~/android/evervolv/
repo init -u git://github.com/Evervolv/android.git -b ics
repo sync
Building Evervolv
Check for updates
First, check for updates in the source:
cd ~/android/evervolv/
repo sync
Configure Build & Compile
Now, the environment must be configured to build and the ROM compiled, from code, for the Ruby
. build/envsetup.sh
lunch 
make CC=gcc-4.4 CXX=g++-4.4 -j2 otapackage
Wait for it to finish showing stuff on terminal

Install
1. Copy your .zip file from ~/android/evervolv/out/target/product/ruby/update.cm-XXXXX-signed.zip to the root of the SD card.
2. Flash zip file from recovery.
3. Enjoy Evervolv on your HTC Amaze 4g



