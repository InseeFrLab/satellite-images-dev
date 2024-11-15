FROM inseefrlab/onyxia-vscode-pytorch:py3.12.3

ENV PROJ_LIB=/opt/conda/share/proj
ENV AWS_S3_ENDPOINT=minio.lab.sspcloud.fr
ENV AWS_DEFAULT_REGION=us-east-1
ENV MLFLOW_S3_ENDPOINT_URL=https://minio.lab.sspcloud.fr
ENV MLFLOW_TRACKING_URI=https://projet-slums-detection-mlflow.user.lab.sspcloud.fr
ENV MLFLOW_ENABLE_ARTIFACTS_PROGRESS_BAR=false

COPY requirements.txt requirements.txt

RUN mamba install -c conda-forge gdal=3.9.3 -y &&\
    pip install -r requirements.txt
