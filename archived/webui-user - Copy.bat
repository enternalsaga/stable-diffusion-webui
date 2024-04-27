@echo off

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS= --autolaunch --deepdanbooru --opt-sdp-no-mem-attention --clip-models-path I:\stable-diffusion-webui_cache\clip --disable-nan-check --no-half-vae
set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.9,max_split_size_mb:512 
set SAFETENSORS_FAST_GPU=1
set "TRANSFORMERS_CACHE=%cd%_cache\huggingface\transformers"
set "HF_HOME=%cd%_cache\huggingface"
set "XDG_CACHE_HOME=%cd%_cache"
set "HF_DATASETS_CACHE=%cd%_cache\huggingface\datasets"
ECHO Cleaning temp folder  
DEL %temp%\*.png
DEL %temp%\*.jpg
DEL outputs\temp\*.png
for /d %%i in (*) do @if exist "%%i\.git" (echo Pulling updates for %%i... & git -C "%%i" pull)
call webui.bat
