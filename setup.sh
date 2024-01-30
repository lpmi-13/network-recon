./generate-keys.sh

# We're setting the subnets and the port numbers for SSH to random values so that each time we run the activity, it's not the exact same configuration, and we need to actually run nmap to work out where the SSH ports are in the other containers.

SUBNET_A=$(./172.sh)
SUBNET_B=$(./10.sh)

sed -i "s/SUBNET_A/${SUBNET_A}/" docker-compose.yml
sed -i "s/SUBNET_B/${SUBNET_B}/" docker-compose.yml

FIRST_PORT=$(shuf -i 2000-19999 -n 1)
SECOND_PORT=$(shuf -i 20000-39999 -n 1)

sed -i "s/FIRST_PORT/${FIRST_PORT}/" Dockerfile-2
sed -i "s/SECOND_PORT/${SECOND_PORT}/" Dockerfile-3
