FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# generate prisma client schema
RUN npx prisma generate

RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# เปิด shell แล้วรันคำสั่ง npx prisma migrate dev --name init และ npm start
CMD ["sh", "-c", "npx prisma migrate deploy && npm start"]
