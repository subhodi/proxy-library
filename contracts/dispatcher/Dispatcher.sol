pragma solidity ^0.4.17;
import "./DispatcherStorage.sol";

contract Dispatcher {
DispatcherStorage dispatcherStorage;

  function Dispatcher(address _addr) {
    dispatcherStorage = DispatcherStorage(_addr);
  }

  function() {
    address target = dispatcherStorage.lib();
    target.delegatecall(msg.data);
  }
}