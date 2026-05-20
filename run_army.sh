#!/bin/bash
cd /data/data/com.termux/files/home/t-lang
while true; do
    echo "[$(date)] Running T con army..."
    ./t_bc lib/advanced/tcon_master.t 2>/dev/null
    echo "[$(date)] Cycle done. Sleeping 60s..."
    sleep 60
done
