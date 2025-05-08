# Usamos una imagen oficial de Node.js como base
FROM node:16

# Establecemos el directorio de trabajo en el contenedor
WORKDIR /app

# Copiamos el archivo package.json y package-lock.json al contenedor
COPY package*.json ./

# Instalamos las dependencias de la aplicación
RUN npm install

# Copiamos todo el código fuente de la aplicación al contenedor
COPY . .

# Creamos la aplicación en modo producción
RUN npm run build

# Exponemos el puerto 3000 para que podamos acceder a la app
EXPOSE 3000

# El comando para ejecutar la aplicación en el contenedor
CMD ["npx", "serve", "build"]
