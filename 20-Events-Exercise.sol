// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

contract EventExample {
    // 1️⃣ Add an event called "NewUserRegistered" with 2 arguments (done)
    // 👉 user as address type (done)
    // 👉 username as string type (done)
    // CODE HERE 👇

    event NewUserRegistered(address indexed user, string username);

    struct User {
        string username;
        uint256 age;
    }

    mapping(address => User) public users;

    function registerUser(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;

        // 2️⃣ Emit the event with msg.sender and username as the inputs
        // CODE HERE 👇
        emit NewUserRegistered(msg.sender, _username);
    }
}
