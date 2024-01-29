FIRST=172
# use 18-31 so we don't conflict with the default docker bridge subnet
SECOND=$(shuf -i 18-31 -n 1)
THIRD=$(shuf -i 0-255 -n 1)
FOURTH=0

echo "${FIRST}.${SECOND}.${THIRD}.${FOURTH}"
