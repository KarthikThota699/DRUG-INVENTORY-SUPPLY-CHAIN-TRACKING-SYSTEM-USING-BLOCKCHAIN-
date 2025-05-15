// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.21;

contract ProductInfo {
    struct Item {
        uint256 id;
        string name;
        string image;
        uint256 qty;
        uint256 ruppess;
    }

    mapping(address => Item[]) public storeProduct;

    function addProduct(
        string memory _name,
        string memory _image,
        uint256 _qty,
        uint256 _ruppees
    ) public {
        uint256 indexCount = storeProduct[msg.sender].length + 1;
        storeProduct[msg.sender].push(
            Item(indexCount, _name, _image, _qty, _ruppees)
        );
    }

    function stateUpdate(
        string memory state,
        uint256 _id,
        uint256 _qty
    ) public {
        Item storage index = storeProduct[msg.sender][_id - 1];

        if (keccak256(abi.encodePacked(state)) == keccak256(abi.encodePacked("Increament"))) {
            index.qty += _qty;
        }
        if (keccak256(abi.encodePacked(state)) == keccak256(abi.encodePacked("Decreament"))) {
            index.qty -= _qty;
        }
    }

    function getProducts(
        address app_user
    )
        public
        view
        returns (
            uint256[] memory,
            string[] memory,
            string[] memory,
            uint256[] memory,
            uint256[] memory
        )
    {
        uint256 index = storeProduct[app_user].length;
        uint256[] memory _id = new uint256[](index);
        string[] memory _name = new string[](index);
        string[] memory _image = new string[](index);
        uint256[] memory _qty = new uint256[](index);
        uint256[] memory _ruppess = new uint256[](index);

        for (uint256 i = 0; i < index; i++) {
            Item storage item = storeProduct[app_user][i];
            _id[i] = item.id;
            _name[i] = item.name;
            _image[i] = item.image;
            _qty[i] = item.qty;
            _ruppess[i] = item.ruppess;
        }
        return (_id, _name, _image, _qty, _ruppess);
    }
}
