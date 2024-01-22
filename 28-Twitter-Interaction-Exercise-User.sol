// SPDX-License-Identifier: MIT

// 1️⃣ Save UserProfile to the mapping in the setProfile() function (done)
// HINT: don't forget to set the _displayName and _bio

pragma solidity ^0.8.22;

contract Profile {
    struct UserProfile {
        string displayName;
        string bio;
    }

    mapping(address => UserProfile) public profiles;

    function setProfile(string memory _displayName, string memory _bio) public {
        // CODE HERE 👇
        UserProfile memory newUserProfile = UserProfile({
            displayName: _displayName,
            bio: _bio
        });

        profiles[msg.sender] = newUserProfile;
    }

    function getProfile(
        address _user
    ) public view returns (UserProfile memory) {
        return profiles[_user];
    }
}
