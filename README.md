# wsl-setup

## WSL (Ubuntu) configuration for machine learning using TensorFlow with CUDA

### Open runcom file

```bash
nano ~/.bashrc
```

### And add aliases at the bottom

```bash
alias bashrc="nvim ~/.bashrc"
alias c="code"
alias n="nvim"
alias jl='jupyter-lab'
alias jn='jupyter-notebook'

alias apti="sudo apt-get install"
alias up='sudo apt-get update && sudo apt-get upgrade -y'
alias cc="sudo apt autoremove -y"
```

### Updating the distribution edition

```bash
sudo nano /etc/update-manager/release-upgrades # Change update channel from lts to normal
sudo do-release-upgrade
```

### Creating .hushlogin

```bash
touch /home/meirb/.hushlogin
```

### System update, upgrade and clean up from old packages

```bash
up
cc
```

### Configuring git

```bash
git config --global user.name "Meirbek"
git config --global user.email "meirbek@email.com"
```

### Installing proprietary NVIDIA drivers with CUDA

```bash
dnfi gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-power xorg-x11-drv-nvidia-cuda nvidia-settings
```

### Checking Nvidia GPU Information in WSL

```bash
nvidia-smi
```

### [Installing Anaconda](https://www.anaconda.com/download)

```bash
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
chmod +x Anaconda*.sh
bash ./Anaconda*.sh -b -u
rm Anaconda*.sh
```

### Scikit-learn acceleration

```bash
conda install scikit-learn-intelex
```

### Updating and cleaning irrelevant Anaconda packages

```bash
conda update conda
conda update --all
conda clean --all
```

### Installing conda version of pip

```bash
conda install pip
which pip
```

### Installing the required Python dependenices

```bash
apti python3-dev python3-pip
```

### Adding C support

```bash
apti gcc clang
```

### Removing the key before installing CUDA + cuDNN

```bash
sudo apt-key del 7fa2af80
sudo rm /etc/apt/trusted.gpg.d/7fa2af80.gpg
```

### Creating a directory to store crash reports

```bash
mkdir crash-reprod
export MLIR_CRASH_REPRODUCER_DIRECTORY=/home/meirb/crash-reprod
```

### Installing Language Server Protocols and python formatters

```bash
npm install bash-language-server
pip install python-language-server # Does not support Python 3.11+
pip install --upgrade jupyter_lsp notebook_shim chardet
pip install pycodestyle mccabe pyflakes pylint rope yapf autopep8 pydocstyle
```

### Installing Jupyter Lab & Notebook dependencies

```bash
conda install jupyterlab notebook nb_conda_kernels chardet
```

### Creating conda environment with TensorFlow + CUDA in WSL

```bash
conda create -n fras pip python=3.11
conda activate fras
pip install --upgrade tensorflow[and-cuda] # stable
pip install --upgrade tf-nightly[and-cuda] # nightly
pip install --upgrade keras==2.15.0
pip install --upgrade customtkinter deepface
conda install opencv matplotlib
# Verifying that Tensorflow is working properly
python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
# Verifying that GPU is available for Tensorflow
python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

### Creating a conda environment with TensorFlow + CUDA on Windows

```powershell
conda create --name fras-gpu pip python=3.9
conda activate fras-gpu
conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0 matplotlib
# Anything above 2.10 is not supported on the GPU on Windows Native
python -m pip install "tensorflow<2.11" jupyter jupyter notebook
# Verify the installation:
python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

### Conda environment autostart

```bash
CONDA_ENV_NAME = "example"
echo "conda activate $CONDA_ENV_NAME" >> ~/.bashrc
echo "conda activate $CONDA_ENV_NAME" >> ~/.zshrc
```

### Disable NUMA unavialability error messages in TensorFlow

```bash
export TF_CPP_MIN_LOG_LEVEL=1
```

### Pulling offical TensorFlow Docker image

```bash
docker pull tensorflow/tensorflow

```

### Run container with GPU support and Python interpreter.

```bash
docker run -it --rm --gpus all tensorflow/tensorflow:latest-gpu python
```

### Run Jupyter Notebook Server with GPU support and Python interpreter.

```bash
docker run -it --rm --gpus all -v $(realpath ~/notebooks):/tf/notebooks -p 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter
```
