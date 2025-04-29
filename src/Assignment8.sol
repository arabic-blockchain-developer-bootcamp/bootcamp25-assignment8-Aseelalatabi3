// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Assignment8 is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    // تمرير العنوان للـ Ownable constructor
    constructor() ERC721("MyNFT", "MNFT") Ownable(msg.sender) {}

    function mintNFT(address to, string memory uri) external onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _mint(to, tokenId);
        _setTokenURI(tokenId, uri);
        _tokenIdCounter.increment();
    }
}
