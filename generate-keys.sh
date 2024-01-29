if [ ! -d ./generated-keys ]; then
    mkdir generated-keys
else
    rm -rf ./generated-keys/key-*
fi

for id in {1..3}; do
  ssh-keygen -t ed25519 -o -a 100 -f ./generated-keys/key-${id} -N ""
done


if [ ! -d ./more-generated-keys ]; then
    mkdir more-generated-keys
else
    rm -rf ./more-generated-keys/key-*
fi

for id in {1..3}; do
  ssh-keygen -t ed25519 -o -a 100 -f ./more-generated-keys/key-${id} -N "Snuffie"
done