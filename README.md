# My Devices

## Setup

Install docker-compose

```shell
sudo apt update
sudo apt install docker-compose
```

Create copy of `.env.example` as `.env` file in root with rails secret key (random string - can be generated using `rake secret`)

Build using docker-compose

```shell
docker-compose build
```

Run container

```shell
docker-compose up -d
```

## Sending Updates

Just send a `POST` request to `<ip>:3000/updates.json` with json content using following format:

```json
{
  "update": {
    "ip_address": "172.168.1.2",
    "mac": "aa:bb:cc:dd:ee:ff",
    "name": "identifier"
  }
}
```

where `name` is an optional identifier for the device.

## Stats

Stats can be posted to `<ip>:3000/stats.json` with json content using following format:

```json
{
  "stat": {
    "mac": "AA:BB:CC:DD:EE:FF",
    "disk": {
      "free": "12G",
      "total": "15G"
    },
    "memory": {
      "free": "803M",
      "total": "927M"
    },
    "kernel": "4.14.98-v7+",
    "hostname": "jonas-labrpi",
    "uptime": "1609.05"
  }
}
```

All parts except the mac-address are optional. If you add a `memory` or `disk` object, you need to specify both `free` and `total` properties.

## Web interface

The devices are reachable via `localhost:3000/devices` and the updates via `localhost:3000/updates`.