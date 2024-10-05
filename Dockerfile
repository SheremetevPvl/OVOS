FROM nginx:alpine 
WORKDIR /usr/share/nginx/html 
COPY data.txt game.js highscore.js index.html server.js style.css ./
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"] 
