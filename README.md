# WSL-Ubuntu

## Needed:
- [Vcxsrv](https://sourceforge.net/projects/vcxsrv/)

## Install WSL2
- Open powershell and digit:
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
- Restart
- Open powershell and digit:
```
wsl --set-default-version 2
```
- Install Ubuntu or any other distro from Microsoft Store
- Start the distro installed and configure it
- Update with:
```
sudo apt update && sudo apt -y upgrade
```
- Install useful things:
```
sudo apt install build-essential net-tools python3-pip
sudo pip3 install virtualenv virtualenvwrapper
```

## Install OhMyZsh
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --recursive git://github.com/joel-porquet/zsh-dircolors-solarized $ZSH_CUSTOM/plugins/zsh-dircolors-solarized
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
pip3 install pygmentize
```

## Install Brew
```
sudo apt-get install build-essential curl file git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.zprofile
```
-Others:
```
brew install exa
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```

## Remove sudo password:
```
echo "`whoami` ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/`whoami` && sudo chmod 0440 /etc/sudoers.d/`whoami`
```

## Docker
```
sudo apt install docker.io -y
docker --version
```
- Add to the bottom of `/etc/sudousers` file:
```
# Docker daemon specification
<yourusername> ALL=(ALL) NOPASSWD: /usr/bin/dockerd
```
Note: replace <yourusername> with your username.
- Update your profile to automatically run docker daemon (in .zshrc):
```
# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then' >> ~/.bashrc
    sudo dockerd > /dev/null 2>&1 &
    disown' >> ~/.bashrc
fi
```
- Add your username to docker group so you can run docker as a non-root user:
```
sudo usermod -aG docker $USER
```
- Try with:
```
docker run hello-world
```
- Install docker-compose:
```
sudo curl -L "https://github.com/docker/compose/releases/download/v1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
  
## GUI - XFCE
```
sudo apt install xrdp xfce4
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini # So it doesn't interfere with Windows RDP on 3389
```
In `/etc/xrdp/startwm.sh`, comment out the last two lines (that mention Xsession) and add:
```
#test -x /etc/X11/Xsession && exec /etc/X11/Xsession
#exec /bin/sh /etc/X11/Xsession
exec startxfce4
```
Start xrdp with:
```
sudo service xrdp start
```
You should be able to connect to your WSL Desktop using the built-in Remote Desktop Connection app. The computer to connect to will be `localhost:3390`. Make sure Xorg is selected as the Session type.

## JetBrains:
```
sudo apt install libcups2 libpangocairo-1.0-0 libatk-adaptor libxss1 libnss3 libxcb-keysyms1 x11-apps libgbm1
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.22.10970.tar.gz
tar -zxf jetbrains-toolbox-*.tar.gz
```
Note: check for last version [here](https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux)
