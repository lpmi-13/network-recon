./generate-keys.sh

SUBNET_A=$(./172.sh)
SUBNET_B=$(./10.sh)

sed -i "s/SUBNET_A/${SUBNET_A}/" docker-compose.yml
sed -i "s/SUBNET_B/${SUBNET_B}/" docker-compose.yml
