pragma solidity ^0.8.0;

contract TransferCoins {
    // инициализируем переменные 
    address private owner;
    mapping (address => uint) wallets;

    // функция для пополнения баланса отправителя
    function Purchase() public {
        wallets[msg.sender] += msg.value;
    }

    // функция списания со счета отправителя
    function Sell(uint value) public {
        if (wallets[msg.sender] >= value) {
            if (msg.sender.call.value(value)() == false) throw;
            wallets[msg.sender] -= value;
        }
    }

    // функция для перевода со счета на другой счет
    function Transfer(address payee, uint value) public {
        require (wallets[msg.sender] >= value);
        require (wallets[payee] + value >= wallets[payee]);
        wallets[msg.sender] -= value;
        wallets[payee] += value;

        return 0;
    }
}




