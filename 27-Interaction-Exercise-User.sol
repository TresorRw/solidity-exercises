// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

// 1️⃣ Create a new Player and save it to players mapping with the given data (done)

contract User {
    struct Player {
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping(address => Player) public players;

    function createUser(address userAddress, string memory username) external {
        // Here if a user have already created it will throw error
        require(
            players[userAddress].playerAddress == address(0),
            "User already exists"
        );

        // Create a new player here 👇
        Player memory newPlayer = Player({
            playerAddress: userAddress,
            username: username,
            score: 0
        });
        players[userAddress] = newPlayer;
    }
}
