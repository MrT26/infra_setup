#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget
PROMETHEUS_VERSION="2.30.3"
ALERTMANAGER_VERSION="0.23.0"
wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
wget https://github.com/prometheus/alertmanager/releases/download/v${ALERTMANAGER_VERSION}/alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz

tar xvfz prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
tar xvfz alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz

sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /usr/local/bin/
sudo mv alertmanager-${ALERTMANAGER_VERSION}.linux-amd64/alertmanager /usr/local/bin/

sudo mkdir /etc/prometheus
sudo mkdir /etc/alertmanager
sudo mkdir /var/lib/prometheus
sudo mkdir /var/lib/alertmanager

# Prometheus configuration file
cat <<EOF | sudo tee /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets:
        - 'localhost:9090'
  - job_name: 'node_exporter'
    static_configs:
      - targets:
        - '172.31.43.242:9100'
        - '172.31.39.245:9100'

rule_files:
  - 'prometheus_rule.yml'
  - 'alerting_rules.yml'

alerting:
  alertmanagers:
    - static_configs:
        - targets:
          - 'alertmanager:9093'

EOF

# systemd service for Prometheus
cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
ExecStart=/usr/local/bin/prometheus --config.file /etc/prometheus/prometheus.yml --storage.tsdb.path /etc/prometheus/data
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Alertmanager configuration file
cat <<EOF | sudo tee /etc/alertmanager/alertmanager.yml
global:
  resolve_timeout: 1m

route:
  receiver: 'email-notifications'

receivers:
  - name: 'email-notifications'
    email_configs:
      - to: 'gudu26011997@gmail.com'
        from: 'gudu26011997@gmail.com'
        smarthost: 'smtp.gmail.com:587'
        auth_username: 'gudu26011997@gmail.com'
        auth_password: 'iiyy pgte ewrc ixax'

  - name: 'slack-notifications'
    slack_configs:
      - api_url: 'https://hooks.slack.com/services/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'
        channel: 'prometheus_alert'
        send_resolved: true

EOF

#Alertmanager service file
sudo cat <<EOF | sudo tee /etc/systemd/system/alertmanager.service
[Unit]
Description=Alertmanager
After=network.target

[Service]
ExecStart=/usr/local/bin/alertmanager \
  --config.file=/etc/alertmanager/alertmanager.yml \
  --storage.path=/var/lib/alertmanager

Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload

sudo systemctl enable prometheus
sudo systemctl enable alertmanager
sudo systemctl start prometheus
sudo systemctl start alertmanager

rm -rf prometheus-${PROMETHEUS_VERSION}.linux-amd64/ prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
rm -rf alertmanager-${ALERTMANAGER_VERSION}.linux-amd64/ alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz

