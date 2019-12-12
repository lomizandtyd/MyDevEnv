# Setting up my Linux developing environment

This repository is only used for me to setup my own environment.

## Record

#### vim config

Thanks for WQ Xu, he gives me the vimrc and plugin set.

```
# Backup and Install
./scripts/copy_vim.sh
```

#### Miniconda

```
# Install
curl -sS https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh | bash -
curl -sS https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/conda.sh && bash /tmp/conda.sh -b -p ~/miniconda3 && ~/miniconda3/bin/conda init
echo "please reopen your terminal"
```
