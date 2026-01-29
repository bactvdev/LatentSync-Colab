# 1. Tải và cài đặt Miniconda (cho Linux)
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
conda init bash
source ~/.bashrc

# 3. Tạo môi trường và cài đặt dependency (theo setup_env.sh)
conda create -y -n latentsync python=3.10.13
conda activate latentsync
conda install -y -c conda-forge ffmpeg
pip install -r requirements.txt
sudo apt -y install libgl1

# 4. Tải model checkpoints
huggingface-cli download ByteDance/LatentSync-1.6 whisper/tiny.pt --local-dir checkpoints
huggingface-cli download ByteDance/LatentSync-1.6 latentsync_unet.pt --local-dir checkpoints