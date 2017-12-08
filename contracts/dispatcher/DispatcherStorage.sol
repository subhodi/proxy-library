pragma solidity ^0.4.17;
contract DispatcherStorage {
    address public lib;

    function DispatcherStorage(address _newLib) {
        replace(_newLib);
    }

    function replace(address _newLib) {
        lib = _newLib;
    }
}
