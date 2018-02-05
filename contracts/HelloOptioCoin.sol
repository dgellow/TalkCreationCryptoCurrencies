pragma solidity ^0.4.4;

contract HelloOptioCoin {
  string message = "Hello OptioPay";

  function HelloOptioCoin() {
    // constructor
  }

  function GetMessage() returns (string) {
    return message;
  }
}
