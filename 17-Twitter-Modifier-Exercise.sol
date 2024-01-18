// SPDX-License-Identifier: MIT

// 1️⃣ Add a function called changeTweetLength to change max tweet length (done)
// HINT: use newTweetLength as input for function (done)
// 2️⃣ Create a constructor function to set an owner of contract (done)
// 3️⃣ Create a modifier called onlyOwner (done)
// 4️⃣ Use onlyOwner on the changeTweetLength function (done)

pragma solidity ^0.8.22;

contract Twitter {
    address owner;
    uint16 public MAX_TWEET_LENGTH = 280;

    constructor () {
        owner = msg.sender;
    }

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Tweet[] ) public tweets;

    modifier onlyOwner () {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    // function to change maximum tweet length
    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long bro!" );

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet( uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory ){
        return tweets[_owner];
    }

}