// SPDX-License-Identifier: MIT

// 1️⃣ Add id to Tweet Struct to make every Tweet Unique (done)
// 2️⃣ Set the id to be the Tweet[] length (done)
// HINT: you do it in the createTweet function (done)
// 3️⃣ Add a function to like the tweet (done)
// HINT: there should be 2 parameters, id and author (done)
// 4️⃣ Add a function to unlike the tweet (done)
// HINT: make sure you can unlike only if likes count is greater then 0 (done)
// 4️⃣ Mark both functions external (done)

pragma solidity ^0.8.22;

contract Twitter {
    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Tweet[]) public tweets;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "YOU ARE NOT THE OWNER!");
        _;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(
            bytes(_tweet).length <= MAX_TWEET_LENGTH,
            "Tweet is too long bro!"
        );

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
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

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }

    function likeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "Tweet Does Not Exists");
        tweets[author][id].likes++;
    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "Tweet Does Not Exists");
        if (tweets[author][id].likes > 0) {
            tweets[author][id].likes--;
        }
    }
}
