FROM n8nio/n8n:latest

WORKDIR /home/node

# EXPOSE phải trùng PORT Render
EXPOSE 10000

# Bắt buộc n8n listen đúng port do Render yêu cầu
CMD ["n8n", "start"]
