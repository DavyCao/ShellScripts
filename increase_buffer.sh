#!/bin/sh
sysctl -w net.ipv4.tcp_rmem='4096 87380 2147483647'
sysctl -w net.ipv4.tcp_wmem='4096 65536 2147483647'
sysctl -w net.ipv4.tcp_no_metrics_save=1
sysctl -w net.ipv4.route.flush=1
