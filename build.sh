#!/bin/bash


source ./config

install_4x4evo () {

echo --
echo Pulling docker image from colgaton/4x4evo
docker pull colgaton/4x4evo
echo Running docker run -d -p 80:80 -p 6668:6668 colgaton/4x4evo
docker run --name 4x4evo -d -p 80:80 -p 6668:6668 colgaton/4x4evo
echo
echo Pulling docker image from colgaton/udpserv
docker pull colgaton/udpserv
echo Running docker run -d -p 1234:1234/udp colgaton/udpserv
docker run --name udpserv -d -p 1234:1234/udp colgaton/udpserv
echo
echo Done installing 4x4Evo.
echo ---

}

install_chuchu () {

echo --
echo Pulling docker image from colgaton/chuchurocket
docker pull colgaton/chuchurocket
echo Running docker run -d -e HOSTIP=$HOSTIP -p 9000:9000 -p 9001:9001 colgaton/chuchurocket
docker run --name chuchu -d -e HOSTIP=$HOSTIP -p 9000:9000 -p 9001:9001 colgaton/chuchurocket
echo
echo Done installing ChuChu Rocket.
echo ---

}

install_toyracer () {

echo --
echo Pulling docker image from colgaton/toyracer
docker pull colgaton/toyracer
echo Running docker run -d -e HOSTIP=$HOSTIP -p 2048:2048 -p 2049:2049/udp -p 8010:8010 colgaton/toyracer
docker run --name toyracer -d -e HOSTIP=$HOSTIP -p 2048:2048 -p 2049:2049/udp -p 8010:8010 colgaton/toyracer
echo
echo Done installing ToyRacer.
echo ---

}

install_gspy () {

echo --
echo Pulling docker image from colgaton/gspyserver
docker pull colgaton/gspyserver
echo Running docker run -d -e HOSTIP=$HOSTIP -p 27900:27900/udp -p 28900:28900 -p 29900:29900 -p 29920:29920 -p 6667:6667 colgaton/gspyserver
docker run --name gspyserver -d -e HOSTIP=$HOSTIP -p 27900:27900/udp -p 28900:28900 -p 29900:29900 -p 29920:29920 -p 6667:6667 colgaton/gspyserver
echo
echo Done installing GameSpy Server.
echo ---

}

install_dcdns () {

echo --
echo Pulling docker image from colgaton/dcdns
docker pull colgaton/dcdns
echo Running docker run -d -e HOSTIP=$HOSTIP -p 53:53/udp colgaton/dcdns
docker run --name dcdns -d -e HOSTIP=$HOSTIP -p 53:53/udp colgaton/dcdns
echo
echo Done installing dcdns.
echo ---

}

install_planetring () {

echo --
echo Pulling docker image from colgaton/planetring
docker pull colgaton/planetring
echo Running docker run -d -e HOSTIP=$HOSTIP -p 7641:7641 -p 8001:8001  -p 7649:7649/udp -p 7650:7650/udp -p 7651:7651/udp -p 7652:7652/udp -p 7653:7653/udp -p 7654:7654/udp colgaton/planetring
docker run --name planetring -d -e HOSTIP=$HOSTIP -p 7641:7641 -p 8001:8001  -p 7649:7649/udp -p 7650:7650/udp -p 7651:7651/udp -p 7652:7652/udp -p 7653:7653/udp -p 7654:7654/udp colgaton/planetring
echo
echo Done installing dcdns.
echo ---

}

if [ ! "$HOSTIP" ]; then
	echo Missing HOSTIP...
	exit
fi

for game in "$@"
do
	case "$game" in
        all)
		echo Deploying all dockers...
		install_4x4evo
		install_toyracer
		install_chuchu
		install_gspy
		install_dcdns
		exit 1
	;;
	4x4evo)
		echo Deploying 4x4Evolution...
		install_4x4evo
	;;
	toyracer)
		echo Deploying Toy Racer...
		install_toyracer
	;;
	chuchu)
		echo Deploying ChuChu Rocket...
		install_chuchu
	;;
	gspy)
		echo Deploying GameSpy Software...
		install_gspy
	;;
        dcdns)
		echo Deploying DCDNS...
		install_dcdns
	;;
        planetring)
		echo Deploying Planet Ring...
		install_planetring
	;;
	*)
		echo Dunno what $game means...quitting.
		exit 1
	esac
done
