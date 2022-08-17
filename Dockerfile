FROM ubuntu

RUN apt update && apt install git build-essential libboost-dev python3 python3-pip unzip -y
RUN pip install pybind11 setuptools numpy matplotlib pyopengl pillow pyzmq pyyaml opencv-python chumpy tensorboardX pyjwt fastapi uvicorn asyncio-nats-streaming

WORKDIR /app

RUN mkdir -p /app/output

RUN git clone https://github.com/MPI-IS/mesh.git /app/mesh
RUN cd mesh && python3 setup.py install

ADD https://raw.githubusercontent.com/Abhi1code/videoavatars/test/vendor/smpl/basicModel_f_lbs_10_207_0_v1.0.0.pkl /app/models/basicModel_f_lbs_10_207_0_v1.0.0.pkl
ADD https://nextcloud.mpi-klsb.mpg.de/index.php/s/W7a57iXRG9Yms6P/download?path=%2F&files=dataset_meta.zip&downloadStartSecret=ey9sonjuzpp /app/data/dataset_meta.zip
RUN cd /app/data && unzip dataset_meta.zip && rm dataset_meta.zip

RUN git clone https://github.com/Mohamed-Fathy-Salah/TailorNet.git /app/TailorNet

CMD ["ls", "/app"]
