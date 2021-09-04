//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Token {
	// Variables
	string public name = "My name";
	string public symbol = "DAPP";
	uint256 public decimals = 18;
	uint256 public totalSupply;

	// Events
	event Transfer(address indexed from, address indexed to, uint256 value);

	// Track balances
	mapping(address => uint256) public balanceOf;

	// Send tokens

	constructor() {
		totalSupply = 1000000 * (10 ** decimals);
		balanceOf[msg.sender] = totalSupply;
	}

	function transfer(address _to, uint256 _value) public returns (bool success) {
		require(balanceOf[msg.sender] >= _value);
		require(_to != address(0));
		balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
		balanceOf[_to] = balanceOf[_to] + _value;
		emit Transfer(msg.sender, _to, _value);
		return true;
	}
}