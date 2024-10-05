@echo off

REM Клонируем репозиторий
git clone https://github.com/bradymadden97/2048-game.git
cd 2048-game

REM Создаем Dockerfile
echo FROM nginx:alpine > Dockerfile
echo WORKDIR /usr/share/nginx/html >> Dockerfile
echo COPY data.txt game.js highscore.js index.html server.js style.css ./ >> Dockerfile
echo EXPOSE 80 >> Dockerfile
echo CMD ["nginx", "-g", "daemon off;"] >> Dockerfile

REM Сборка Docker-образа
docker build -t 2048-game .

REM Запуск контейнеров
docker run -d -p 8080:80 --name 2048-game-1 2048-game
docker run -d -p 8081:80 --name 2048-game-2 2048-game