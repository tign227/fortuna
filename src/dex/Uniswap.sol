// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../interface/ISwap.sol";

contract Uniswap is ISwap {


    function trySwap() external returns (bool) {
        return true;
    }

    function swapThreshold() external view returns (uint256) {
        return 1000000000000000000; // 10 wei
    }

    function _stableCoinVolume() internal view returns (uint256) {
        return 0;
    }

    function buyMemeWithStableCoin(uint256 _amount) external {

    }

    function swapStableCoinWithMeme(uint256 _amount) external {

    }


}
