#/bin/sh

WORKDIR=`pwd`

export DEBUG=1

exitCommand() {
	exit $1
}

runCommand() {
	echo $CMD
	$CMD
	if [ $? -ne 0 ]; then
		echo -e "[FAIL] $CMD"
		exitCommand 3
	fi 
}

if [ -d "$HOME/.kk-shell" ]; then
	cd "$HOME/.kk-shell"
	git pull origin master
	chmod +x $HOME/.kk-shell/web/build.sh
	chmod +x $HOME/.kk-shell/web/view.py
	cd $WORKDIR
else
	git clone http://github.com/kkserver/kk-shell $HOME/.kk-shell
	chmod +x $HOME/.kk-shell/web/build.sh
	chmod +x $HOME/.kk-shell/web/view.py
fi

echo `pwd`

CMD="$HOME/.kk-shell/web/build.sh"
runCommand

#docker
CMD="docker build -t registry.cn-hangzhou.aliyuncs.com/kk/kk-job-web:debug ."
runCommand

CMD="docker run -p 8080:80 --rm registry.cn-hangzhou.aliyuncs.com/kk/kk-job-web:debug"
runCommand
