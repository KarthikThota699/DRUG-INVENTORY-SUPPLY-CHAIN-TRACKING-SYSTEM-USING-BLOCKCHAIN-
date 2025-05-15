// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.21;

contract PurchaseHistory {
    struct Purchase {
        uint256 id;
        string name;
        string mobile;
        string email;
        string addresses;
        string pname;
        string image;
        string status;
        uint256 qty;
        uint256 cost;
        uint256 total;
        string point;
        string stateOfPurchase;
    }
    mapping(address => Purchase[]) public purchaseState;

    function setData(
        string memory _name,
        string memory _mobile,
        string memory _email,
        string memory _addresses,
        string memory _pname,
        string memory _image,
        string memory _status,
        uint256 _qty,
        uint256 _cost,
        uint256 _total,
        string memory stateof
    ) public {
        uint256 index = purchaseState[msg.sender].length + 1;
        purchaseState[msg.sender].push(
            Purchase(
                index,
                _name,
                _mobile,
                _email,
                _addresses,
                _pname,
                _image,
                _status,
                _qty,
                _cost,
                _total,
                "Not",
                stateof
            )
        );
    }

    function getDataHistory()
        public
        view
        returns (
            uint256[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            string[] memory,
            string[] memory
        )
    {
        uint256 index = purchaseState[msg.sender].length;

        uint256[] memory _id = new uint256[](index);
        string[] memory _name = new string[](index);
        string[] memory _mobile = new string[](index);
        string[] memory _email = new string[](index);
        string[] memory _addresses = new string[](index);
        string[] memory _pname = new string[](index);
        string[] memory _image = new string[](index);
        string[] memory _status = new string[](index);
        uint256[] memory _qty = new uint256[](index);
        uint256[] memory _cost = new uint256[](index);
        uint256[] memory _total = new uint256[](index);
        string[] memory _point = new string[](index);
        string[] memory _purchaseState = new string[](index);

        for (uint256 i = 0; i < index; i++) {
            Purchase storage p = purchaseState[msg.sender][i];
            _id[i] = p.id;
            _name[i] = p.name;
            _mobile[i] = p.mobile;
            _email[i] = p.email;
            _addresses[i] = p.addresses;
            _pname[i] = p.pname;
            _image[i] = p.image;
            _status[i] = p.status;
            _qty[i] = p.qty;
            _cost[i] = p.cost;
            _total[i] = p.total;
            _point[i] = p.point;
            _purchaseState[i] = p.stateOfPurchase;
        }
        return (
            _id,
            _name,
            _mobile,
            _email,
            _addresses,
            _pname,
            _image,
            _status,
            _qty,
            _cost,
            _total,
            _point,_purchaseState
        );
    }

    function updatePurchase(string memory _status, uint256 _id) public {
        uint256 index = purchaseState[msg.sender].length;

        for (uint256 id = 0; id < index; id++) {
            Purchase storage pur = purchaseState[msg.sender][id];
            if (_id == pur.id) {
                pur.status = _status;
            }
        }
    }
    function cancelTheOrder(string memory _status, uint256 _id) public {
        uint256 index = purchaseState[msg.sender].length;

        for (uint256 id = 0; id < index; id++) {
            Purchase storage pur = purchaseState[msg.sender][id];
            if (_id == pur.id) {
                pur.point = _status;
            }
        }
    }

    function getAccordingToUser(
        string memory useremail
    )
        public
        view
        returns (
            uint256[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory,
            uint256[] memory,
            uint256[] memory,
            uint256[] memory,
            string[] memory,string[] memory
        )
    {
        uint256 index = purchaseState[msg.sender].length;

        uint256[] memory _id = new uint256[](index);
        string[] memory _name = new string[](index);
        string[] memory _mobile = new string[](index);
        string[] memory _email = new string[](index);
        string[] memory _addresses = new string[](index);
        string[] memory _pname = new string[](index);
        string[] memory _image = new string[](index);
        string[] memory _status = new string[](index);
        uint256[] memory _qty = new uint256[](index);
        uint256[] memory _cost = new uint256[](index);
        uint256[] memory _total = new uint256[](index);
        string[] memory _point = new string[](index);
        string[] memory _purchaseState = new string[](index);

        for (uint256 i = 0; i < index; i++) {
            Purchase storage p = purchaseState[msg.sender][i];
            if (
                keccak256(abi.encodePacked(useremail)) ==
                keccak256(abi.encodePacked(p.email))
            ) {
                _id[i] = p.id;
                _name[i] = p.name;
                _mobile[i] = p.mobile;
                _email[i] = p.email;
                _addresses[i] = p.addresses;
                _pname[i] = p.pname;
                _image[i] = p.image;
                _status[i] = p.status;
                _qty[i] = p.qty;
                _cost[i] = p.cost;
                _total[i] = p.total;
                _point[i] = p.point;
                _purchaseState[i]=p.stateOfPurchase;
            }
        }
        return (
            _id,
            _name,
            _mobile,
            _email,
            _addresses,
            _pname,
            _image,
            _status,
            _qty,
            _cost,
            _total,
            _point,
            _purchaseState
        );
    }
}
