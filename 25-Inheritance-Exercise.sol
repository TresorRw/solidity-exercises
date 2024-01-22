// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

// 1️⃣ Inherit from the Multiplayer Game (done)
// 2️⃣ Call the parent joinGame() function (done)
// HINT: you might have to use the super keyword
// 3️⃣ Increment playerCount in joinGame() function (done)

// MultiplayerGame contract
contract MultiplayerGame {
    mapping(address => bool) public players;

    function joinGame() public virtual {
        players[msg.sender] = true;
    }
}

// Game contract inheriting from MultiplayerGame
contract Game is MultiplayerGame {
    string public gameName;
    uint256 public playerCount;

    constructor(string memory _gameName) {
        gameName = _gameName;
        playerCount = 0;
    }

    function startGame() public {
        // Perform game-specific logic here
    }

    function joinGame() public override {
       super.joinGame();
       playerCount++;
    }
}