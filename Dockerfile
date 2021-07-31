# Build commands:
# docker build -t project_name . 


FROM nvcr.io/nvidia/pytorch:21.06-py3

RUN apt-get update && apt-get install -y libgl1-mesa-glx

RUN CUDA_HOME=/usr/local/cuda \
    CUDNN_INCLUDE_DIR=/usr/local/cuda \
    CUDNN_LIB_DIR=/usr/local/cuda \
    BASICSR_EXT=True pip install basicsr

#RUN pip install --upgrade --force-reinstall facexlib && pip install fastapi pytest multipart
COPY ./GFPGAN/requirements.txt /app/GFPGAN/
WORKDIR /app/GFPGAN
RUN pip install -r requirements.txt
RUN wget https://github.com/TencentARC/GFPGAN/releases/download/v0.1.0/GFPGANv1.pth -P experiments/pretrained_models
RUN wget https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth -P /opt/conda/lib/python3.8/site-packages/facexlib/weights

EXPOSE 8000
ENV BASICSR_JIT='True'


# use docker-compose (up) --build to build the docker image
# use below command to run the docker image 
# docker run -p 8000:8000 --gpus all --rm -v /c/Projects/photoEnhance/GFPGAN:/app/GFPGAN -it photo_enhance_application 
# python inference_gfpgan_full.py --model_path experiments/pretrained_models/GFPGANv1.pth --test_path inputs/whole_imgs

#Run initialization.sh after running docker
