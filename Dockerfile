# Image chính thức của n8n
FROM n8nio/n8n:latest

# Render cần app listen ở 0.0.0.0:10000
ENV N8N_PORT=10000
ENV N8N_HOST=0.0.0.0
ENV PORT=10000
ENV N8N_PROTOCOL=http

# Làm việc trong thư mục của n8n
WORKDIR /home/node

# Mở cổng 10000 cho Render
EXPOSE 10000

# Chạy n8n khi container khởi động
CMD ["n8n", "start"]
