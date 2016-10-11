#/bin/sh

./compressor.sh

echo "docker build -t kk/kk-job-web:latest ."

docker build -t kk/kk-job-web:latest .

if [ $? -ne 0 ]; then
	echo -e "docker build -t kk/kk-job-web:latest ."
	exit
fi

echo "docker run -p 88:80 --rm kk/kk-job-web:latest"

docker run -p 88:80 --rm kk/kk-job-web:latest

if [ $? -ne 0 ]; then
	echo -e "docker run -p 88:80 --rm kk/kk-job-web:latest"
	exit
fi
