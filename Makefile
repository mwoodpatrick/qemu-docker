install:
	sudo apt install docker-buildx
	sudo apt install docker-compose-v2

build:
	docker buildx build --load -t mwoodpatrick/proxmoxd:latest --label mylabel=xxx .

run:
	docker run -it --rm -e "BOOT=https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-standard-3.18.2-x86_64.iso" -p 5900:5900 --device=/dev/kvm --cap-add NET_ADMIN --name proxmox --mount source=/mnt/wsl,destination=/mnt/wsl,type=bind mwoodpatrick/proxmoxd:latest
	tset

run_alpine:
	docker run -it --rm -e "BOOT=https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-standard-3.18.2-x86_64.iso" -p 5900:5900 --device=/dev/kvm --cap-add NET_ADMIN --name proxmox --mount source=/mnt/wsl,destination=/mnt/wsl,type=bind mwoodpatrick/proxmoxd:latest /usr/bin/tini -s /run/entry.sh
	tset
