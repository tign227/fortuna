// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface ISwap {

    function buyMemeWithStableCoin(uint256 _amount) external;

    function swapStableCoinWithMeme(uint256 _amount) external;

}
