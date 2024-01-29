# Network Recon

This is a simple micromaterial to practice the steps involved in lateral movement through a network involving reconnaisance inside a host and using `nmap` to enumerate the network.

## Jump into the first container

(When this is set to run in GitPod, we'll probably just start by sending the user directly into the first container).

Run some local reconnaisance with `ifconfig` to see what network you're on.

Then once you know where you are, run a scan with `nmap` to see what other hosts you can contact, and which ones are running SSH.

```
nmap -sV IP_ADDRESS_OF_THE_NETWORK/CIDR (probably a /24)
```

## Tricky bits

- the service running SSH on the other hosts might not be on port 22
- you might need to work out which user to ssh as
- sometimes you'll need to ssh with just a private key stored on the host you're connecting from, othertimes with an ssh key and password.
- if you want to try and work out the users and/or passwords, there should be some clues in the home directory
