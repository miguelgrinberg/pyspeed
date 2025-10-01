#!/bin/bash
LABEL=$1
shift

DATE=$(which gdate)
if [[ "$DATE" == "" ]]; then
    DATE=$(which date)
fi

start1=$($DATE +%s.%N)
$* >/dev/null
end1=$($DATE +%s.%N)
start2=$($DATE +%s.%N)
$* >/dev/null
end2=$($DATE +%s.%N)
start3=$($DATE +%s.%N)
$* >/dev/null
end3=$($DATE +%s.%N)

runtime=$(uv run python -c "print(f'{((${end1} - ${start1} + ${end2} - ${start2} + ${end3} - ${start3}) / 3):.04f}')")
echo "$runtime $LABEL"
