# dcgames-servers

Script that pull and setup the docker images for the following Dreamcast game servers:

* 4x4Evolution
* ToyRacer
* ChuChu Rocket
* Starlancer (using the GameSpy suite)
* PBA Tour Bowling 2001 (using the GameSpy suite)

It also installs dcdns, a container that runs a dns server setup to support the game servers.

Make sure you set the HOSTIP variable in the config file. This is the IP where the servers will listen.
