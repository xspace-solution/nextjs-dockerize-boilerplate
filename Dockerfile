# Use a Node 16 base image
FROM node:16-alpine

# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files
COPY . .

ENV NODE_ENV production
ENV PORT 3000
EXPOSE 3000

# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci 
# Build the app
RUN npm run build
# ==== RUN =======

CMD [ "npm", "start" ]