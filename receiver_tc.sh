modprobe ifb
ip link set dev ifb0 up
tc qdisc add dev enp1s0f0 ingress
tc filter add dev enp1s0f0 parent ffff: protocol ip u32 match u32 0 0 flowid 1:1 action mirred egress redirect dev ifb0

# Add bandwidth limit
tc qdisc add dev ifb0 handle 1: root htb default 11
tc class add dev ifb0 parent 1: classid 1:1 htb rate 50mbps
tc class add dev ifb0 parent 1:1 classid 1:11 htb rate 50mbps
tc qdisc add dev ifb0 parent 1:11 handle 6: netem delay 10ms

# Delete tc config
tc qdisc del dev ifb0 root
tc filter del dev enp1s0f0 root
tc qdisc del dev enp1s0f0 ingress
ip link set dev ifb0 down