# Dockerfile — minimal for Render
FROM n8nio/n8n:latest

# Set sensible default host
ENV N8N_HOST=0.0.0.0
ENV GENERIC_TIMEZONE=Asia/Ho_Chi_Minh

# At runtime we need n8n to bind to the PORT Render gives us.
# This start command ensures N8N_PORT is set from the Render-provided PORT env var.
CMD ["sh", "-lc", "export N8N_PORT=${PORT:-5678} && exec n8n"]

