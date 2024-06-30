// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {ITokenVault} from "./interface/ITokenVault.sol";
import {IERC20} from "./interface/IERC20.sol";

contract MemeVault is ITokenVault {

    address public memeToken;

    mapping(address => uint256) public balances;

    constructor(address _memeToken) {
        memeToken = _memeToken;
    }

    function deposit(uint256 _amount) external override {
        require(IERC20(memeToken).transferFrom(msg.sender, address(this), _amount), "transfer failed");
        balances[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount) external override {
        require(balances[msg.sender] >= _amount, "insufficient balance");
        balances[msg.sender] -= _amount;
        require(IERC20(memeToken).transfer(msg.sender, _amount), "transfer failed");
    }

    function _shouldSwap() internal view returns (bool) {
        return true;
    }

}
