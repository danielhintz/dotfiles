#!/bin/sh

API_TOKEN=$(pass show simplelogin/api)
iterations=$(echo $(curl --silent -X GET "https://app.simplelogin.io/api/stats" -H "Authentication: $API_TOKEN" | jq '.nb_alias') / 20 + 1 | bc)
for page_id in $(seq 0 $iterations); do
    {
        curl --silent -X GET "https://app.simplelogin.io/api/v2/aliases?page_id=$page_id" -H "Authentication: $API_TOKEN" | jq '.aliases[].email' | cut -b 2- | rev | cut -b 2- | rev
    } &
done | sort
wait
