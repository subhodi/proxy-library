pragma solidity ^0.4.17;
import "../oraclize/oraclizeAPI.sol";
contract ConvertionLib is usingOraclize {
    address private owner = msg.sender;
    uint256 public rate=10;

    function ConvertionLib() {
        OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);
        // oraclize_query("URL", "json(https://api.coindesk.com/v1/bpi/currentprice/inr.json).bpi.INR.rate_float");
    }

    function setRate(uint256 _rate)  public {
        rate = _rate;
    }

    function __callback(bytes32 _oraclizeID, string _result) {
        require(msg.sender == oraclize_cbAddress());
        rate = parseInt(_result, 3);
        oraclize_query(60*30, "URL", "json(https://api.coindesk.com/v1/bpi/currentprice/inr.json).bpi.INR.rate_float");
    }
}
