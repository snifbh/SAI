#!/bin/bash
sudo -v
for idx in 0 1 2 3 4 5 6 7; do
    intf0="sw_port$(($idx))"
    intf1="host_port$(($idx))"
    net="host_net$(($idx))"
    if sudo ip link show $intf0 &> /dev/null; then
        sudo ip link delete $intf0 type veth
    fi
    if sudo ip link show $intf1 &> /dev/null; then
        sudo ip link delete $intf1 type veth
    fi
    if sudo ip netns show $net &> /dev/null; then
        sudo ip netns delete $net 
    fi
done
intf0="cpu_port"
intf1="host_port"
net="hostif_net"
if sudo ip link show $intf0 &> /dev/null; then
    sudo ip link delete $intf0 type veth
fi
if sudo ip link show $intf1 &> /dev/null; then
    sudo ip link delete $intf1 type veth
fi
if sudo ip netns show $net &> /dev/null; then
    sudo ip netns delete $net 
fi