if ps -a | grep 'node';then
    echo 'API is running';
else
    cd /home/www/api/ && node index.js;
fi
