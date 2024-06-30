// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface ITokenVault {

    function deposit(uint256 _amount) external;

    function withdraw(uint256 _amount) external;

    function shouldSwap() external returns (bool);
}
