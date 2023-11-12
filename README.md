# Network Recon

This is a simple micromaterial to practice the steps involved in lateral movement through a network involving reconnaisance inside a host and using `nmap` to enumerate the network.

## Jump into the first container

(When this is set to run in GitPod, we'll probably just start by sending the user directly into the first container).

Run some local reconnaisance with `ifconfig` to see what network you're on.

Then once you know where you are, run a scan with `nmap` to see what other hosts you can contact, and which ones are running SSH.

```
nmap -sV IP_ADDRESS_OF_THE_NETWORK/CIDR (probably a /16)
```

## Tricky bits

- The service running SSH on the other hosts might not be on port 22
- you might need to work out which user to ssh as
- sometimes you'll need to ssh with a password, othertimes with an ssh key stored on the host you're connecting from
- if you want to try and workout the users that use a particular host to log into another host, try the `last` command. That should give you some usernames to try when you attempt to ssh.
