# Using node 14 image
FROM node:14

# Working Directory /app
WORKDIR /app

# Copy all local files to container
COPY . .

# Set up env node mode and DB
ENV NODE_ENV=production DB_HOST=item-db

# Install dependency 
RUN npm install --production --unsafe-perm && npm run build

# Expose port container
EXPOSE 8080

# Start container
CMD ["npm", "start"]