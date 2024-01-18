// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// 1️⃣ Make a contract called Calculator (done)
// 2️⃣ Create Result variable to store result (done)
// 3️⃣ Create functions to add, subtract, and multiply to result (done)
// 4️⃣ Create a function to get result (done)

contract Calculator {
    uint256 internal result;

    function add (uint256 nbr) public {
        result += nbr;
    }

    function subtract(uint256 nbr) public {
        result -= nbr;
    }

    function divide (uint256 nbr) public {
        result /= nbr;
    }

    function multiply(uint256 nbr) public {
        result *= nbr;
    }

    function getResult() public view returns (uint) {
        return result;
    }
}
