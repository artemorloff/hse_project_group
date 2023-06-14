// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@oracle/interfaces/FootballScoresAggregator.sol";

contract ScoreRetrieveContract {
   // инициализируем переменные 
   address private beneficiary;
   int public score;

   // создаем событие, в котором будет сохранена цена
   event ScoreIsRetrieved(address game, int score);

   // функция для указания админа
   function initializeBeneficiary(address _beneficiary) public {
       beneficiary = _beneficiary;
   }

   // функция для получения цены
   function retrieveScore(address game, string game_name) public returns (int) {
       require(
           game != address(0x0),
           "Ошибка! Адрес запроса не должен быть пустым!"
       );

       FootballScoresAggregator retriever = FootballScoresAggregator(feed);
       int _score = retriever.get(game_name);
       score = _score;

       emit ScoreRetrievedFrom(game, _score);

       return score;
   }
}