@echo off

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=--ckpt-dir "I:\stable-diffusion-webui-1.5.0\models\Stable-diffusion"^
	    --vae-dir "I:\stable-diffusion-webui-1.5.0\models\vae"^
	    --lora-dir "I:\stable-diffusion-webui-1.5.0\models\lora"^
	    --embeddings-dir "I:\stable-diffusion-webui-1.5.0\embeddings"^
	    --hypernetwork-dir "I:\stable-diffusion-webui-1.5.0\models\hypernetworks"^
	    --esrgan-models-path "I:\stable-diffusion-webui-1.5.0\models\ESRGAN"^
	    --gfpgan-models-path "I:\stable-diffusion-webui_cache\clip"^
	    --bsrgan-models-path "I:\stable-diffusion-webui_cache\clip"^
	    --realesrgan-models-path "I:\stable-diffusion-webui_cache\clip"^
	    --styles-file "I:\stable-diffusion-webui-1.5.0\styles.csv"^
	    --clip-models-path "I:\stable-diffusion-webui_cache\clip"^
	    --autolaunch^
	    --no-download-sd-model
set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.9,max_split_size_mb:512 
set SAFETENSORS_FAST_GPU=1
set "TRANSFORMERS_CACHE=stable-diffusion-webui_cache\huggingface\transformers"
set "HF_HOME=stable-diffusion-webui_cache\huggingface"
set "XDG_CACHE_HOME=stable-diffusion-webui_cache"
set "HF_DATASETS_CACHE=stable-diffusion-webui_cache\huggingface\datasets"
ECHO Cleaning temp folder  
DEL %temp%\*.png
DEL %temp%\*.jpg
DEL outputs\temp\*.png
for /d %%i in (*) do @if exist "%%i\.git" (echo Pulling updates for %%i... & git -C "%%i" pull)
call webui.bat
