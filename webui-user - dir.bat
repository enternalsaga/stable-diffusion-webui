@echo off

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS= ^
	    --autolaunch^
	    --no-half-vae^
	    --no-download-sd-model^
	    --opt-sdp-no-mem-attention --opt-split-attention --xformers --opt-channelslast --skip-torch-cuda-test --skip-python-version-check --skip-version-check --no-hashing
set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.9,max_split_size_mb:512 
ECHO Cleaning temp folder  
DEL %temp%\*.png
DEL %temp%\*.jpg
DEL outputs\temp\*.png
call webui.bat