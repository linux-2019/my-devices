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

## Web interface

The devices are reachable via `localhost:3000/devices` and the updates via `localhost:3000/updates`.