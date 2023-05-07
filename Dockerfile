FROM tensorflow/tensorflow:2.7.0-gpu
MAINTAINER Lim suyun <"bluelemonsky@naver.co.kr">

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN apt-key del 7fa2af80 && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
RUN apt-key del F60F4B3D7FA2AF80 && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
RUN apt-get update       
RUN apt-get upgrade -y

RUN apt-get install -y gcc binutils cmake git
RUN apt-get clean && apt-get autoremove -y
RUN apt-get install openjdk-8-jdk -y

RUN apt-get install jupyter-notebook -y

RUN apt-get install fonts-nanum* -qq

RUN python -m pip install --upgrade pip setuptools wheel

WORKDIR /data/nlp
ADD  requirements.txt /data/nlp

RUN pip install -r ./requirements.txt

CMD ["bash"]