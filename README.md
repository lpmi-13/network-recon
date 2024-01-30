# Network Recon

This is a simple micromaterial to practice the steps involved in lateral movement through a network involving reconnaisance inside a host and using `nmap` to enumerate the network.

## Run in Gitpod

This is intended to run entirely in gitpod, so please run it there for the smoothest experience.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/lpmi-13/network-recon)


## Network architecture

You'll start in a container that's running in Subnet A without any access to Subnet B. The flag is in a container running in Subnet B, so figure out how to get over there.

> you could technically exit the ssh session from the first container and then `docker exec` into the last container, but where's the fun in that?!?!

1. Container 1 - This is running in Subnet A. It's the first container you'll enter to start traversing the network.
2. Container 2 - This is running in both Subnet A and Subnet B.
3. Container 3 - This is running in Subnet B. It's got the flag that you need to find the value of.

### Jump into the first container

In Gitpod, you'll be SSH'ed into the first container when everything's ready to rock. After that, you can follow the steps below to move across the network until you find the flag (the contents are "FOUND ME").

Run some local reconnaisance with `ifconfig` to see what network you're on.

Then once you know where you are, run a scan with `nmap` to see what other hosts you can contact, and which ones are running SSH.

```sh
nmap -p- -sV IP_ADDRESS_OF_THE_NETWORK/CIDR (probably a /24)
```

> the `-p-` part of the `nmap` command means "scan all ports" (0-65535), and since the SSH servers are not necessarily running on common ports, we'll need to make sure we find them.

## Running locally

Though this is intended to run in gitpod, if you wanna try it out locally, just make sure to run `./setup.sh` before you start. This will configure the different ssh keys and randomize the subnets you'll be traversing.

To enter the first container, you can connect via the following command:

```sh
ssh -i initial-key alice@$(docker inspect $(docker ps | grep first | awk '{print $1}') | jq -r '.. | ."IPAddress"? | select(. != null and . != "")')
```


## Tricky bits

- the service running SSH on the other hosts might not be on port 22
- you might need to work out which user to ssh as
- sometimes you'll need to ssh with just a private key stored on the host you're connecting from, othertimes with an ssh key and password.
- if you want to try and work out the users and/or passwords, there should be some clues in the home directory
