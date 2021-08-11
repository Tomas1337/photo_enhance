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
    docker-compose up

4. Finally inside the gfpgan docker, run:

    uvicorn main:app --host 0.0.0.0 --port 8000 --reload

5. This app uses celery for task queing. Run the celery server on a different terminal but on the same docker image as where fastapi & GFPGAN is:

    celery -A celeryConfig.celery_app worker -l info --concurrency 1 -f celery.log -E


# Deploy Docker Image
Note:
1. You can also create a docker image from these instructions to distribute. If so, skip to docker run instructions and use the docker image that was built