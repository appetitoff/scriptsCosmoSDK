#!/bin/bash
GREEN_COLOR='\033[0;32m'
RED_COLOR='\033[0;31m'
WITHOU_COLOR='\033[0m'
DELEGATOR_ADDRESS='game...'
VALIDATOR_ADDRESS='gamevaloper...'
PWD='pass wallet'
DELAY=86400 #in secs - how often restart the script 
ACC_NAME=wallet name 
NODE=http://localhost:26657 #change it only if you use another rpc port of your node

for (( ;; )); do
        echo -e "Get reward from Delegation"
        echo -e "${PWD}\ny\n" | nibirud tx distribution withdraw-all-rewards --from ${ACC_NAME} --fees 20ugame --chain-id neuron-1 --yes
        for (( timer=10; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOUT_COLOR} sec\r" $timer
                sleep 1
        done

        BAL=$(nibirud query bank balances ${DELEGATOR_ADDRESS} --node ${NODE});
        # BAL=$(($BAL -100000))
        echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} ugame\n"
        echo -e "Claim rewards\n"
        echo -e "${PWD}\n${PWD}\n" | nibirud tx distribution withdraw-rewards ${VALIDATOR_ADDRESS} --chain-id neuron-1 --from ${ACC_NAME} --node ${NODE} --commission -y --fees 5000ugame
        for (( timer=10; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
                sleep 1
        done
        BAL=$(nibirud query bank balances ${DELEGATOR_ADDRESS} --node ${NODE} -o json | jq -r '.balances | .[].amount');
        BAL=$(($BAL -100000))
        echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} ugame\n"
        echo -e "Stake ALL 11111\n"
        echo -e "${PWD}\n${PWD}\n" | nibirud tx staking delegate ${VALIDATOR_ADDRESS} ${BAL}ugame --chain-id neuron-1 --from ${ACC_NAME} --node ${NODE} -y --fees 5000ugame
        for (( timer=${DELAY}; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
                sleep 1
        done       

done
