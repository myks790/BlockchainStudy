#geth 설치 및 실행
##라즈베리파이에 geth 설치
참고 url : https://owocki.com/install-ethereum-geth-raspberry-pi-b/

##geth 명령어
###블록체인 초기화
geth --datadir ./ init ./genesis.json
###geth 실행
geth --networkid 10 --nodiscover --datadir ~/Blockchain/test-net console 2>> ~/block-chain/test-net/geth.log
###계정 생성
personal.newAccount("pw")
###블록 내용 확인
eth.getBlock(1)
###마이닝
- 시작 : miner.start(쓰레드 수)
- 상태 확인 : eth.mining
###코인 베이스 잔액 확인
eth.getBalance(eth.accounts[0])


##에러 해결법
###out of memory가 발생할 때
--cache=? 옵션 추가


##참고할 만한 사이트
https://chainskills.com/2017/02/24/create-a-private-ethereum-blockchain-with-iot-devices-16/

###!!!라즈베리파이에서는 채굴이 안됨!!!
