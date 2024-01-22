// SPDX-License-Identifier: MIT

// 1️⃣ Create a loop to calcualte all expenses for the user (done)
// HINT: Create a total expenses variable with uint type (done)
// HINT: Loop over expenses array with for loop (done)
// HINT: add up all expenses cost (done)
// HINT: return total expenses (done)

pragma solidity ^0.8.22;

contract ExpenseTracker {
    struct Expense {
        address user;
        string description;
        uint amount;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense(msg.sender, "Groceries", 50));
        expenses.push(Expense(msg.sender, "Transportation", 30));
        expenses.push(Expense(msg.sender, "Dining out", 25));
    }

    function addExpense(string memory _description, uint _amount) public {
        expenses.push(Expense(msg.sender, _description, _amount));
    }

    function getTotalExpenses(address _user) public view returns (uint) {
        uint256 totalExpenses = 0;
        for (uint256 i = 0; i < expenses.length; i++) {
            if(expenses[i].user == _user) {
                totalExpenses += expenses[i].amount;
            }
        }
        return totalExpenses;
    }
}
