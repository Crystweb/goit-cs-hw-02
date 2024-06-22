#!/bin/bash
logs="website_status.log"
sites=(
    https://google.com
    https://g00gle.com
    https://facebook.com
    https://x.com
    https://xnxx-x.com
    https://docker.com/
)

> "$logs"

FAIL_CODE=6

check_status(){

    RED="\033[1;31m"
    GREEN="\033[1;32m"
    BLUE="\033[1;34m"
    NC="\033[0m"

    curl -sf "${1}" > /dev/null

    if [ ! $? = ${FAIL_CODE} ];then
        echo -e "${GREEN}${1} is UP${NC}"
        echo "$1 is UP" >> "$logs"
    else
        echo -e "${RED}${1} is DOWN${NC}"
        echo "$1 is DOWN" >> "$logs" 
    fi
}

for site in "${sites[@]}"; do
    check_status "$site"
done

echo -e "\n${GREEN}>> ${BLUE}Результати записано у файл логів ./$logs${NC}"