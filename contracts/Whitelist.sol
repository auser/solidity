pragma solidity 0.4.24;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";


contract Whitelist is Ownable {
    mapping (address => bool) whitelist;
    uint whitelistNum;

    event AddedToWhitelist(address indexed addr);
    event RemovedFromWhitelist(address indexed addr);

    constructor() Ownable() public {}

    function addToWhitelist(address addr) public onlyOwner {
        whitelist[addr] = true;
        whitelistNum++;
        emit AddedToWhitelist(addr);
    }

    function removeFromWhitelist(address addr) public onlyOwner {
        whitelist[addr] = false;
        whitelistNum++;
        emit RemovedFromWhitelist(addr);
    }

    function isWhitelisted(address addr) public view returns (bool) {
        if (whitelistNum == 0) {
            return false;
        }
        return whitelist[addr];
    }
}
