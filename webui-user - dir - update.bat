@echo off

call database.bat
set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=%DIR_ARG% %STYLE_DIR_ARG% %CN_DIR% %LYCO_DIR%^
	    --autolaunch^
	    --no-download-sd-model
set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.9,max_split_size_mb:512 
set SAFETENSORS_FAST_GPU=1
set CUDA_VISIBLE_DEVICES=0
set "TRANSFORMERS_CACHE=stable-diffusion-webui_cache\huggingface\transformers"
set "HF_HOME=stable-diffusion-webui_cache\huggingface"
set "XDG_CACHE_HOME=stable-diffusion-webui_cache"
set "HF_DATASETS_CACHE=stable-diffusion-webui_cache\huggingface\datasets"
ECHO Cleaning temp folder  
DEL %temp%\*.png
DEL %temp%\*.jpg
DEL outputs\temp\*.png
git pull
call webui.bat
