pragma solidity 0.4.24;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";


contract Blacklist is Ownable {
    mapping (address => bool) blacklist;
    uint blacklistNum;

    event AddedToBlacklist(address indexed addr);
    event RemovedFromBlacklist(address indexed addr);

    constructor() Ownable() public {}

    function addToBlacklist(address addr) public onlyOwner {
        blacklist[addr] = true;
        blacklistNum++;
        emit AddedToBlacklist(addr);
    }

    function removeFromBlacklist(address addr) public onlyOwner {
        blacklist[addr] = false;
        blacklistNum--;
        emit RemovedFromBlacklist(addr);
    }

    function isBlacklisted(address addr) public view returns (bool) {
        if (blacklistNum == 0) {
            return false;
        }
        return blacklist[addr];
    }
}
