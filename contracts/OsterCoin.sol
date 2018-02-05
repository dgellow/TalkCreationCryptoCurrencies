pragma solidity ^0.4.18;

contract OsterCoin {
  mapping (address => uint256) public balanceOf;
  string public name;
  string public color;
  string public symbol;
  uint8 public decimals;

  event Transfer(address indexed from, address indexed to, uint256 value);

  function OsterCoin(uint256 initialSupply, string tokenName, string tokenSymbol, string tokenColor, uint8 decimalUnits) public {
        balanceOf[msg.sender] = initialSupply;
        name = tokenName;
        symbol = tokenSymbol;
        decimals = decimalUnits;
        color = tokenColor;
    }

  function transfer(address to, uint256 value) public {
    require(balanceOf[msg.sender] >= value && balanceOf[to] + value >= balanceOf[to]);

    balanceOf[msg.sender] -= value;
    balanceOf[to] += value;

    Transfer(msg.sender, to, value);
  }
}
