FROM python:3.9.13-slim-buster

RUN apt update && apt install git build-essential libboost-dev unzip python3-opencv -y
RUN pip install pybind11 setuptools numpy matplotlib pyopengl pillow pyzmq pyyaml opencv-python chumpy tensorboardX 

WORKDIR /app

RUN mkdir -p /app/output

RUN git clone https://github.com/MPI-IS/mesh.git /app/mesh
RUN cd mesh && python3 setup.py install

COPY . .

CMD ["ls", "/app"]
