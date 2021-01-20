# cloud-init for a quick bachelor project server on Hetzner Cloud


Run following command to create a new server using the `hcloud` cli:

```sh
hcloud server create --name bp --location nbg1 --image ubuntu-20.04 --type cx11 \
  --ssh-key 2754649,2765746 --user-data-from-file ./config_minimal.yml
```

or with `curl` (and `jq`):

```sh
curl \
  -X POST -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer $TOKEN' \
  -d '{"name": "bp", "location": "nbg1", "image": "ubuntu-20.04", "server_type": "cx11", "ssh_keys": ["pw@fruitbook_for_server"], "user_data": "#include\nhttps://raw.githubusercontent.com/weiland/hetzner-cloud-init-bp/main/config.yml"}' \
  https://api.hetzner.cloud/v1/servers | \
  jq .server.public_net.ipv4.ip
```

Make sure to have an API Token with write access at `$TOKEN` (` set TOKEN '...'`).

Local:

```sh
scp internal.sh bp:./internal.sh
```

On server:

```sh
sh internal.sh
```


After work is done, the server can be deleted:

 ```sh
 hcloud server delete bp
 ```

