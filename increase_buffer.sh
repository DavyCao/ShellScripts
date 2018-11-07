#!/bin/sh
sysctl -w net.core.rmem_max=2147483647
sysctl -w net.core.wmem_max=2147483647
sysctl -w net.core.rmem_default=65536
sysctl -w net.core.wmem_default=65536
sysctl -w net.ipv4.tcp_rmem='4096 87380 2147483647'
sysctl -w net.ipv4.tcp_wmem='4096 65536 2147483647'
sysctl -w net.ipv4.tcp_mem='85968 114627 171936'
sysctl -w net.ipv4.tcp_slow_start_after_idle=0
sysctl -w net.ipv4.tcp_no_metrics_save=1
sysctl -w net.ipv4.route.flush=1

ethtool -K eth0 rx off
ethtool -K eth0 tx off
ethtool -K eth0 sg off
ethtool -K eth0 tso off
ethtool -K eth0 ufo off
ethtool -K eth0 gso off
ethtool -K eth0 gro off
ethtool -K eth0 lro off