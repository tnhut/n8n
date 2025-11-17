# 1. Base image chính thức n8n
FROM n8nio/n8n:latest

# 2. Thiết lập user để chạy n8n (không dùng root)
USER root

# 3. Copy toàn bộ source code repo (nếu bạn có workflow/custom node)
COPY . /home/node/

# 4. Đặt working directory
WORKDIR /home/node

# 5. Cài thêm package nếu cần (tùy workflow)
# RUN npm install some-package --legacy-peer-deps

# 6. Đặt quyền user
RUN chown -R node:node /home/node

# 7. Sử dụng node user chính thức của n8n
USER node

# 8. Expose port 5678
EXPOSE 5678

# 9. Thiết lập timezone nếu muốn (env)
ENV GENERIC_TIMEZONE="Asia/Ho_Chi_Minh"

# 10. Khởi chạy n8n
CMD ["n8n", "start"]
