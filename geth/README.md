# geth 설치 및 실행
## 라즈베리파이에 geth 설치
참고 url : https://owocki.com/install-ethereum-geth-raspberry-pi-b/

## geth 명령어
### 블록체인 초기화
geth --datadir ~/Blockchain/test-net init ~/Blockchain/test-net/genesis.json
### geth 실행
geth --networkid 10 --nodiscover --datadir ~/Blockchain/test-net console 2>> ~/Blockchain/test-net/geth.log
#### 외부 접속 가능하게 geth 실행
geth --networkid 10 --rpc --rpcaddr "0.0.0.0" --rpcport 8545 --rpcvhosts=localhost --rpccorsdomain "*" --rpcapi "admin, db, eth, debug, miner, net, shh, txpool, personal, web3" --nodiscover --datadir ~/Blockchain/test-net console 2>> ~/Blockchain/test-net/geth.log
#### 로컬호스트에서 미스트 접속용 geth실행
geth --ipcpath ~/Blockchain/geth.ipc --networkid 10 --nodiscover --datadir ~/Blockchain/test-net console 2>> ~/Blockchain/test-net/geth.log

#### 외부 접속
geth attach rpc:http://myks790.iptime.org:18545
#### 주요 옵션 설명
https://opentutorials.org/course/2869/20676
##### DNS Rebind Protection - geth 외부접속시 403 
https://github.com/ethereum/go-ethereum/pull/15962
http://blockchaindev.kr/models/content/76


### 계정 생성
personal.newAccount("pw")
### 블록 내용 확인
eth.getBlock(0)
### 마이닝
- 시작 : miner.start(쓰레드 수)
- 상태 확인 : eth.mining
### 코인 베이스 잔액 확인
eth.getBalance(eth.accounts[0])

### 송금하기
eth.sendTransaction({from:eth.accounts[0], to:eth.accounts[1],value:web3.toWei(1,"ether")})

### 거래 확인
eth.getTransaction("거래 해시")
### 거래 영수증 확인
eth.getTransactionReceipt("거래 해시")
### 특정 시점 잔액 확인
web3.fromWei(eth.getBalance(eth.accounts[1],블록 높이),"ether")

## api 참고
https://github.com/ethereum/wiki/wiki/JavaScript-API
https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console

# 공식 지갑 - 미스트 월릿 설치
https://github.com/ethereum/mist/releases
## 미스트 월릿으로 원격 접속하기
"/Applications/Ethreum Wallet.app/Contents/MacOS/Ethereum Wallet" --rpc http://myks790.iptime.org:18545
/Applications/Ethereum\ Wallet.app/Contents/MacOS/Ethereum\ Wallet --rpc http://localhost.org:18545
### 미스트 월릿 geth와 동기화(네트워크 구성 후 ipc로 연결해야 실시간으로 동기화 )
/Applications/Ethereum\ Wallet.app/Contents/MacOS/Ethereum\ Wallet --rpc ~/Blockchain/geth.ipc

## 에러 해결법
###out of memory가 발생할 때
--cache=? 옵션 추가

## 참고할 만한 사이트
https://chainskills.com/2017/02/24/create-a-private-ethereum-blockchain-with-iot-devices-16/

### !!!라즈베리파이에서는 채굴이 안됨!!!


# private network cluster
http://blockchaindev.kr/models/content/88
## enode 확인
admin.nodeInfo.enode
## node등록
admin.addPeer("enode:~~~")