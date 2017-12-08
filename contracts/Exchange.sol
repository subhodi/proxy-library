pragma solidity ^0.4.17;
import './upgradableLib/convertionLib.sol';
contract Exchange {
    address private owner = msg.sender;
    address private convertionLibAddr;
    uint256 public rate=12;

    function Exchange(address _convertionLibAddr) {
        convertionLibAddr = _convertionLibAddr;
    }

    function setRate(uint256 _rate) {
        convertionLibAddr.delegatecall(bytes4(sha3("setRate(uint256)")), _rate);
    } 

    // function() {
    //     convertionLibAddr.delegatecall(msg.data);
    // } 
}
