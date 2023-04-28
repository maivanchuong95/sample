#!/bin/bash

# Đặt tên cho container và image
IMAGE_NAME=sample_image
CONTAINER_NAME=sample_image_container

# Build image từ Dockerfile
docker build -t $IMAGE_NAME .

# Kiểm tra xem image đã được build thành công hay chưa
if [ $? -eq 0 ]
then
  echo "Image built successfully"
else
  echo "Image build failed"
  exit 1
fi

# Xóa container nếu đã tồn tại
docker rm -f $CONTAINER_NAME || true

# Chạy container từ image với cổng 8080 được map vào cổng 80 của container
docker run -d -p 8080:80 --name $CONTAINER_NAME $IMAGE_NAME

# Kiểm tra xem container đã được chạy thành công hay chưa
if [ $? -eq 0 ]
then
  echo "Container is running"
else
  echo "Container failed to start"
  exit 1
fi
