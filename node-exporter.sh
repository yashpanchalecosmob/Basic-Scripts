#!/bin/sh

cd /usr/local/src/
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar -zxvf node_exporter-0.18.1.linux-amd64.tar.gz

echo "SOURCE HAS BEEN DOWNLOADED"

touch /etc/systemd/system/node_exporter.service

echo "
[Unit]
Description=Send CPU & Memory statastic to the Homer Server
After=network.target

[Service]
ExecStart=/usr/local/src/node_exporter-0.18.1.linux-amd64/node_exporter
Restart=on-failure
RestartSec=10s
Type=simple

[Install]
WantedBy=multi-user.target
" >> /etc/systemd/system/node_exporter.service

echo "SERVICE FILE HAS BEEN CREATED"

systemctl daemon-reload

systemctl start node_exporter.service

systemctl enable node_exporter.service

echo "node_exporter SERVICE HAS BEEN STARTED & ENABLED"

systemctl status node_exporter.service
