pragma solidity ^0.8.0;

contract Lottery {
    // инициализация переменных и событий
    address public operator;
    address[] public participants;
    uint public Block;
    mapping (address => uint) private participantID;
    event Bet(address who);
    event Round(uint numBlock)

    // функция для проведения раунда лотереи
    function playLottery(uint number) public {
        if (msg.sender != operator) {
            participantID[msg.sender] = number;
            participants.push(msg.sender);
            Bet(msg.sender);
        } else {
            require(block.number - Block > 3);
            Block - block.number;

            for (uint k = 0; k < participants.length; k++) {
                if (participantID[participants[k]] == number) {
                    betters[participants[k]].active = true;
                    MakeBet(participants[k], betters[participants[k]]);
                }
            }
        }
    }
}




