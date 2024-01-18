// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

// 1️⃣ Define a Tweet Struct with author, content, timestamp, likes (done)
// 2️⃣ Add the struct to array (done)
// 3️⃣ Test Tweets (done)

contract Twitter {

    // define our struct
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }


    // add our code
    mapping(address => Tweet[] ) internal tweets;

    function createTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets() public view returns (Tweet[] memory ){
        return tweets[msg.sender];
    }

}