# photo_enhance

Build steps

# Build Docker Image
1. Inside a CUDA Enabled VM copy the repo with command:
    
    git clone https://github.com/Tomas1337/photo_enhance

2. Initialize the submodules with

    cd photo_enhance
    git submodule init
    git submodule update

    Note: Make sure the GFPGAN is the right branch (stable)

3. Build then run docker from the docker-compose file

    docker-compose build -t photo_enhance_application:stable

    docker run -p 8000:8000 --gpus all --rm -v ./GFPGAN:/app/GFPGAN -it photo_enhance_application:stable

4. Finally inside docker, run:

    uvicorn main:app --host = 0.0.0.0 -p 8000

# Deploy Docker Image
Note:
1. You can also create a docker image from these instructions to distribute. If so, skip to docker run instructions and use the docker image that was built