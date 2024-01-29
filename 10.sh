FIRST=10
SECOND=$(shuf -i 0-255 -n 1)
THIRD=$(shuf -i 0-255 -n 1)
FOURTH=0

echo "${FIRST}.${SECOND}.${THIRD}.${FOURTH}"
