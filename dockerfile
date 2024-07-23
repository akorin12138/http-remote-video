FROM python:3.10.14
WORKDIR /app
COPY . /app

COPY requirements.txt .

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 libgl1 v4l-utils -y

RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

EXPOSE 1721

CMD [ "python", "./server.py" ]