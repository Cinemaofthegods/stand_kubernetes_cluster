# DeepPavlov Docker images

## Base images

Base images allow to run any DeepPavlov config from specific DP version.

### CPU

#### Build instructions:

```shell script
docker build -t deeppavlov/base:<dp_version> \
    --build-arg PYTHON_BASE_IMAGE=<python_base_docker_image> \
    --build-arg COMMIT=<dp_version> .
```

#### Run instructions:

```shell script
docker run -e CONFIG=<dp_config_name> -p <your_port>:5000 \
    -e COMMIT=<git_commit_id> \
    -v <dp_logs_volume>:/logs \
    -v <dp_components_volume>:/root/.deeppavlov \
    deeppavlov/base:<dp_version>
```

### GPU

#### Build instructions:

```shell script
docker build -t deeppavlov/base-gpu:<dp_version> \
    --build-arg NVIDIA_BASE_IMAGE=<python_base_docker_image> \
    --build-arg COMMIT=<dp_version>
    --build-arg CUDNN_VERSION=<cudnn_version>
    --build-arg PYTHON_VERSION=<python_version> .
```

#### Run instructions:

```shell script
docker run -e CONFIG=<dp_config_name> -p <your_port>:5000 \
    --runtime=nvidia \
    -e COMMIT=<git_commit_id> \
    -v <dp_logs_volume>:/logs \
    -v <dp_components_volume>:/root/.deeppavlov \
    deeppavlov/base-gpu:<dp_version>
```

## Model images

Model images allow to run specific DeepPavlov config from specific DP version.

### Build instructions:

```shell script
docker build -t deeppavlov/<dp_config_name>[_gpu]:<dp_version> \
    --build-arg BASE_IMAGE=<dp_base_image> \
    --build-arg COMMIT=<dp_version> \
    --build-arg CONFIG=<dp_config_name>
```

#### CPU run instructions:

```shell script
docker run -e CONFIG=<dp_config_name> -p <your_port>:5000 \
    -v <dp_logs_volume>:/logs \
    -v <dp_components_volume>:/root/.deeppavlov \
    deeppavlov/ner_ru:cpu
```

#### GPU run instructions:

```shell script
docker run -e CONFIG=<dp_config_name> -p <your_port>:5000 \
    --runtime=nvidia \
    -v <dp_logs_volume>:/logs \
    -v <dp_components_volume>:/root/.deeppavlov \
    deeppavlov/ner_ru:gpu

```

## For now we are using:

### CPU

| COMMIT | PYTHON_BASE_IMAGE       | latest |
| ------ | ----------------------- | ------ |
| 0.5.1  | python:3.7-slim-stretch | V      |
| 0.3.0  | python:3.6-slim-stretch |        |

### GPU

| COMMIT | NVIDIA_BASE_IMAGE                  | CUDNN_VERSION | PYTHON_VERSION | latest |
| ------ | ---------------------------------- | ------------- | -------------- | ------ |
| 0.5.1  | nvidia/cuda:10.0-devel-ubuntu16.04 | 7.6.2.24      | 3.7.4          | V      |
| 0.3.0  | nvidia/cuda:9.0-devel-ubuntu16.04  | 7.1.4.18      | 3.6.9          |        |