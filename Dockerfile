FROM inseefrlab/onyxia-python-pytorch:py3.11.6

ENV PROJ_LIB=/opt/mamba/share/proj
ENV AWS_S3_ENDPOINT=minio.lab.sspcloud.fr
ENV AWS_DEFAULT_REGION=us-east-1
ENV MLFLOW_S3_ENDPOINT_URL=https://minio.lab.sspcloud.fr
ENV MLFLOW_TRACKING_URI=https://projet-slums-detection-128833.user.lab.sspcloud.fr
ENV MLFLOW_ENABLE_ARTIFACTS_PROGRESS_BAR=false

COPY requirements.txt requirements.txt

RUN mamba install -c conda-forge gdal=3.8.4 -y &&\
    pip install -r requirements.txt &&\
    pre-commit install &&\
    git config --global credential.helper store
