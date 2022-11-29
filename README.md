# WSL-Ubuntu

## Install WSL2
- Open powershell and digit:
```
wsl --install
```
- Restart
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

## Remove sudo password:
```
echo "`whoami` ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/`whoami` && sudo chmod 0440 /etc/sudoers.d/`whoami`
```

## Install OhMyZsh
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
### Themes
- Install fonts in `Font powerlevel10k` folder
- Set the installed font in Ubuntu Terminal settings
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
- Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`
```
source ~/.zshrc
```
- Configure theme
- Edit `~/.p10k.zsh` for more customization
### Plugins
- [Fast Syntax Highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting): `git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting`, then add `fast-syntax-highlighting` to `~/.zshrc` plugin list;
- [Zsh Autosuggestion](https://github.com/zsh-users/zsh-autosuggestions): `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`, then add `zsh-autosuggestions` to `~/.zshrc` plugin list;
- [Zsh Dircolors Solarized](https://github.com/joel-porquet/zsh-dircolors-solarized): `git clone --recursive https://github.com/joel-porquet/zsh-dircolors-solarized $ZSH_CUSTOM/plugins/zsh-dircolors-solarized`, then add `zsh-dircolors-solarized` to `~/.zshrc` plugin list;
- [Zsh 256 Color](https://github.com/chrissicool/zsh-256color): `( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )`, then add `zsh-256color` to `~/.zshrc` plugin list;
- [Auto Color Ls](https://github.com/gretzky/auto-color-ls): `( cd $ZSH_CUSTOM/plugins && git clone https://github.com/gretzky/auto-color-ls )`, then add `auto-color-ls` to `~/.zshrc` plugin list (`colorls` needed - `gem install colorls`);
- [Oh My Matrix](https://github.com/amstrad/oh-my-matrix): ` git clone https://github.com/amstrad/oh-my-matrix ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/oh-my-matrix`, then add `oh-my-matrix` to `~/.zshrc` plugin list;
- [Autoupdate](https://github.com/tamcore/autoupdate-oh-my-zsh-plugins): `git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate`, then add `autoupdate` to `~/.zshrc` plugin list;
- [Zsh Colorls](https://github.com/Kallahan23/zsh-colorls): `git clone https://github.com/Kallahan23/zsh-colorls ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-colorls`, then add `zsh-colorls` to `~/.zshrc` plugin list (`colorls` needed - `gem install colorls`);
- [Zsh Interactive Cd](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-interactive-cd): Add `zsh-colorls` to `~/.zshrc` plugin list (`fzf` needed - see [installation instructions](https://github.com/junegunn/fzf#installation));
- [Git](https://github.com/davidde/git): `git clone https://github.com/davidde/git.git ~/.oh-my-zsh/custom/plugins/git`, then add `git` to `~/.zshrc` plugin list;

## Alias
Add the following aliases in `~/.zshrc`
```
ZSH_ALIAS_FINDER_AUTOMATIC=true
alias cat="ccat"
alias less="cless"
alias ls="colorls"
alias python="python3"
```

## Brew
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

## Docker
```
sudo apt install docker.io -y
docker --version
```
- Add to the bottom of `/etc/sudoers` file:
```
# Docker daemon specification
<yourusername> ALL=(ALL) NOPASSWD: /usr/bin/dockerd
```
Note: replace <yourusername> with your username.
- Update your profile to automatically run docker daemon (in .zshrc or .bashrc, based on your shell):
```
# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
    sudo dockerd > /dev/null 2>&1 &
    disown
fi
```
- Add your username to docker group so you can run docker as a non-root user:
```
sudo usermod -aG docker $USER
newgrp docker
```
- Try with:
```
docker run hello-world
```

### Install docker-compose:
```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version
```
Check last version [here](https://github.com/docker/compose/releases).

### Portainer
#### Install
```
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```
#### Update
```
docker stop portainer
docker rm portainer
docker pull portainer/portainer-ce:latest
docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

## Ruby
```
sudo apt install git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc (or .bashrc, based on your shell)
source ~/.zshrc
rbenv install -l
rbenv install 3.1.2
rbenv global 3.1.2
gem install bundler
```
### Install Rails
```
gem install rails -v 7.0.4
```

## Angular CLI
### Install Node.js
```
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.zshrc
nvm install v18
node -v
npm -v
```
### Install Angular CLI
```
npm install @angular/cli --location=global
ng version 
```

## Virtualenv Wrapper
```
sudo pip install virtualenvwrapper
```
- Add in `~/.zshrc`:
```
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
```
