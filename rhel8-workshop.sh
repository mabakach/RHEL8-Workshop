#!/bin/bash

## This script is intended to be run:
##     on the control host (ie: workstation)
##     CWD =  ~root/RHEL8-Workshop

myInventory="./config/master-config.yml"

if [ ! -e "${myInventory}" ] ; then
    echo "ERROR: Are you in the right directory? Can not find ${myInventory}" ; exit
    exit
fi
    
case "$1" in
    "all")
        time  ansible-playbook -i ${myInventory} -f 10  ./playbooks/rhel8-workshop.yml
        ;;

    "appstream"   | \
    "boom"        | \
    "buildah"     | \
    "ebpf"        | \
    "firewalld"   | \
    "kpatch"      | \
    "nftables"    | \
    "pbench"      | \
    "podman"      | \
    "prep"        | \
    "stratis"     | \
    "systemd"     | \
    "tlog"        | \
    "vdo"         | \
    "virt"        | \
    "wayland"     | \
    "webconsole")

        time  ansible-playbook -i ${myInventory} -f 10 --tags $1 ./playbooks/rhel8-workshop.yml
        ;;

    *)
        echo "USAGE: bastion-setup.sh [ all | appstream | boom | buildah | ebpf | firewalld | kpatch | nftables | pbench | podman | prep | stratis | systemd | tlog | vdo | virt | wayland | webconsole ]"
        ;;

esac

