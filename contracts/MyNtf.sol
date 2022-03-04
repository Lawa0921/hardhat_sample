//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.12;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNft is ERC721 {
  constructor() ERC721("MyNft", "MY-NFT") {}
}
