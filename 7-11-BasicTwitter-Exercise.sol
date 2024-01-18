// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

// 1️⃣ Create a Twitter Contract (done)
// 2️⃣ Create a mapping between user and tweet (done)
// 3️⃣ Add function to create a tweet and save it in mapping (done)
// 4️⃣ Create a function to get Tweet (done)
// 5️⃣ Add array of tweets (done)

contract Twitter {
     mapping (address => string[] ) tweets;

    function createTweet(string memory tweetText) public {
        tweets[msg.sender].push(tweetText);
    }

    function getUserTweet() public view returns (string[] memory) {
        return tweets[msg.sender];
    }
}