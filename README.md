setup.git For Ubuntu desktop
=========
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/DoubleDoub/setup.git
git checkout -b ubuntu-desktop origin/ubuntu-desktop

this does not work all to great


manually install nvm to avoid permission errors will fix nvm permission related errors.

[install nvm](https://github.com/creationix/nvm)

./setup/setup.sh   
```

See also http://github.com/startup-class/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.





