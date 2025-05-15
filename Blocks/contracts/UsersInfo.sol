// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.21;

contract UsersInfo {
    struct User {
        uint256 id;
        string name;
        string email;
        string mobile;
        string addresses;
        string password;
    }
    mapping(address => User[]) public users;

    function addUser(
        string memory _password,
        string memory name,
        string memory addresses,
        string memory _mobile,
        string memory _email
    ) public {
        uint256 newUserid = users[msg.sender].length + 1;
        users[msg.sender].push(
            User(newUserid, name, _email, _mobile, addresses, _password)
        );
    }

    function updateUser(
        string memory name,
        string memory addresses,
        string memory _mobile,
        string memory _password,
        uint256 id
    ) public {
        User storage user = users[msg.sender][id];
        user.name = name;
        user.addresses = addresses;
        user.password = _password;
        user.mobile = _mobile;
    }

    function loginSubmit(
        address app_user,
        string memory _email,
        string memory _password
    )
        public
        view
        returns (
            uint256,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        uint256 indexSize = users[app_user].length;

        string memory _emails;
        string memory _mobile;
        string memory _name;
        uint256 _id;
        string memory _addresses;

        for (uint256 i = 0; i < indexSize; i++) {
            User storage userCheck = users[app_user][i];
            bool passwordCheck = keccak256(
                abi.encodePacked(userCheck.password)
            ) == keccak256(abi.encodePacked(_password));
            bool emailCheck = keccak256(abi.encodePacked(userCheck.email)) ==
                keccak256(abi.encodePacked(_email));
            if (emailCheck && passwordCheck) {
                _emails = userCheck.email;
                _id = userCheck.id;
                _name = userCheck.name;
                _addresses = userCheck.addresses;
                _mobile = userCheck.mobile;
                return (_id, _name, _addresses, _email, _mobile);
            }
        }
        return (_id, _name, _addresses, _emails, _mobile);
    }

    function getEveryUser(
        address app_user
    )
        public
        view
        returns (
            uint256[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory
        )
    {
        uint256 index = users[app_user].length;
        uint256[] memory _id = new uint256[](index);
        string[] memory _email = new string[](index);
        string[] memory _mobile = new string[](index);
        string[] memory _name = new string[](index);
        string[] memory _addresses = new string[](index);

        for (uint256 i = 0; i < index; i++) {
            User storage userPoint = users[app_user][i];
            _id[i] = userPoint.id;
            _email[i] = userPoint.email;
            _mobile[i] = userPoint.mobile;
            _name[i] = userPoint.name;
            _addresses[i] = userPoint.addresses;
        }
        return (_id, _name, _email, _mobile, _addresses);
    }
}
