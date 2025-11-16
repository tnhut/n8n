FROM n8nio/n8n:latest

# Set timezone nếu cần
ENV GENERIC_TIMEZONE=Asia/Ho_Chi_Minh
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https

# Render cung cấp PORT → ta map nó sang N8N_PORT
ENV N8N_PORT=${PORT}

# Không override CMD
# Vì image chính thức đã có entrypoint:
#  ENTRYPOINT ["tini", "--", "n8n"]
