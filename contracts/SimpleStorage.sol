pragma solidity ^0.5.0;

contract SimpleStorage {
  address payable owner;
  uint storedValue;

  constructor() public {
    owner = msg.sender;
  }

  function set(uint x) public {
    storedValue += x * 100;
  }

  function get() public view returns (uint) {
    return storedValue;
  }

  function reset() public onlyOwner {
    storedValue = 0;
  }

  function destroy() public onlyOwner {
    selfdestruct(owner);
  }

  modifier onlyOwner {
      require(
          msg.sender == owner,
          "Only owner can call this function."
      );
      _;
  }
}
