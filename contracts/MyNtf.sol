//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract MyNFT is ERC721, Ownable {                 // 這行表示 contract 同時繼承於 ERC721URIStorage 與 Ownable
  using Counters for Counters.Counter;              // 這行表示將 Counters 的各種 function 掛載到 Counters.Counter 這個物件身上，理解上有點像 ruby 的 include
  using Strings for uint256;                        // 這行表示將 Strings 的各種 function 掛載到 uint256 上
  Counters.Counter private _tokenIds;               // 這行表示將 _tokenIds 這個 private 變數設為 Counters.Counter 的 struct，基本上就是一般的宣告變數，只是將它宣告成 Counters.Counter
  mapping (uint256 => string) private _tokenURIs;   // 這行表示將 _tokenURIs 這個 private 變數定義為 mapping (uint256 => string) 的資料格式

  constructor() ERC721("MyNFT", "MNFT") {}          // 這行表示在部署時給 ERC721 的 contract constructor 帶入參數
  function _setTokenURI(uint256 tokenId, string memory _tokenURI)
    internal
    virtual
  {
    _tokenURIs[tokenId] = _tokenURI;
  }

  function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    returns (string memory)
  {
    require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
    string memory _tokenURI = _tokenURIs[tokenId];
    return _tokenURI;
  }

  function mint(address recipient, string memory uri)
    public
    returns (uint256)
  {
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _mint(recipient, newItemId);
    _setTokenURI(newItemId, uri);
    return newItemId;
  }
}
