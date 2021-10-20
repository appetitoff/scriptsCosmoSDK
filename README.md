# ReStaking script - auto claiming and delegating rewards for Game (neuron-1) Network

1. Download the script from my repository:

```bash
wget https://raw.githubusercontent.com/appetitoff/scriptsCosmoSDK/main/restakingGame.sh
```

2. Give the permissions to this file:

```bash
chmod +x restakingGame.sh
```

3. Edit this script with your credentials -> change these parameters: DELEGATOR='Your delegator address' ;
VALIDATOR='Your validator address' ;
PASWD='pass phrase from cli' ;
DELAY=36000 #in secs - how often restart the script ;
ACC_NAME=YourWalleName 
 
 ```bash
nano restakingGame.sh
```
4. Open the screen session:
 
 ```bash
screen -S restakingGamescript
```
5. Run auto claiming and delegating rewards:

 ```bash
bash restakingRizon.sh
```
6. Enjoy it :)
