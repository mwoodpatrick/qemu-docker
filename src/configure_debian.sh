#!/usr/bin/env bash
set -Eeuo pipefail

apt-get update && apt-get -y upgrade && \
apt-get --no-install-recommends -y install \
    	apt-transport-https \
	python3-requests \
	lsb-release  \
	curl \
	nano \
	sudo \
	neovim \
	ssh \
	software-properties-common \
	gnupg2 \
 	tini \
	wget \
        ovmf \
	procps \
	iptables \
	iproute2 \
	dnsmasq \
	net-tools \
        qemu-utils \
	ca-certificates \
	netcat-openbsd \
	qemu-system-x86 \
    && echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" | sudo tee /etc/apt/sources.list.d/pve-install-repo.list \
    && wget --no-check-certificate https://download.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg \
    && chmod +r /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg \
    && apt-get update \
    && apt-get full-upgrade \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    # && apt-get install --no-install-recommends -y mailutils proxmox-ve postfix open-iscsi chrony \
