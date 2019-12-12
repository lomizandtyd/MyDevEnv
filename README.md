# Setting up my Linux developing environment

This repository is only used for me to setup my own environment.

## Record

#### system config
```
# Install
sudo apt install build-essential libsndfile1-dev libboost-dev zlib1g-dev libopencc-dev
sudo apt install sox libsox-dev ffmpeg
sudo apt install gawk dos2unix tmux
```

#### tmux config

Thanks for [SpicyCode](https://gist.github.com/spicycode/1229612)

```
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.tmux.conf.bak
cp tmux/.tmux.conf ~/
```

#### vim config

Thanks for WQ Xu, he gives me the vimrc and plugin set.

```
# Backup and Install
./scripts/copy_vim.sh
```

#### Miniconda

```
# Install
curl -sS https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/conda.sh && bash /tmp/conda.sh -b -p ~/miniconda3 && ~/miniconda3/bin/conda init
echo "please reopen your terminal"

# Install my packages after reopen terminal
conda install numpy scipy regex
pip install -r requirements.txt
```
