// SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

// 1️⃣  Use require to limit the length of the tweet to be only 280 characters (DONE)
// HINT: use bytes to length of tweet

contract Twitter {

    uint16 constant MAX_TWEET_LENGTH = 280;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // add our code
    mapping(address => Tweet[] ) public tweets;

    function createTweet(string memory _tweet) public {
        // conditional
        // if tweet length <= 280 then we are good, otherwise we revert
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Length shoud be less than 280 characters");

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