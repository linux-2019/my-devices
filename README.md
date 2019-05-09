# My Devices

## Setup

Install docker-compose

```shell
sudo apt update
sudo apt install docker-compose
```

Create `.env` file in root with rails secret key (random string - can be generated using `rake secret`):

```text
RAILS_SERCREdasdas=dsasjdsajdiorethjreiuthrjtureh
```

Build

```shell
docker-compose build
```

Run container

```shell
docker-compose -d up
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