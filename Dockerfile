# Apple iOS 26 Monaco Edition Frontend
# Author: Jonathan Sherman
# Copyright: © 2025 Jonathan Sherman. All Rights Reserved.
# Version: 5.0.0

FROM nginx:alpine

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy frontend files
COPY index.html /usr/share/nginx/html/

# Set permissions
RUN chmod -R 755 /usr/share/nginx/html

# Expose port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Add labels
LABEL maintainer="Jonathan Sherman"
LABEL version="5.0.0"
LABEL description="Apple iOS 26 Monaco Edition Frontend"
LABEL copyright="© 2025 Jonathan Sherman. All Rights Reserved."

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
