// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {IVault} from "./interface/IVault.sol";
import {ITokenVault} from "./interface/ITokenVault.sol";
import  {MemeVault} from "./MemeVault.sol";
import {ISwap} from "./interface/ISwap.sol";

contract Fortuna is IVault {

    mapping(address => MemeVault) public vaults;

    address[] public memes;

    ISwap public swap;

    constructor(address _uniswapRouter) {
        swap = ISwap(_uniswapRouter);
    }

    function create(address _token)  external {
        ITokenVault vault = vaults[_token];
        require(address(vault) == address(0), "Fortuna:Already supported");
        vaults[_token] = new MemeVault(_token);
    }

    function depositMeme(address _token, uint256 _amount)  external {
        ITokenVault vault = vaults[_token];
        require(address(vault)!= address(0), "Fortuna: not supported");
        vault.deposit(_amount);
    }

    function withdrawMeme(address _token, uint256 _amount)  external {
        ITokenVault vault = vaults[_token];
        require(address(vault)!= address(0), "Fortuna: not supported");
        vault.withdraw(_amount);
    }

    function triggerMemeTrade() external {
        //use cache to reduce gas usage, since we put storage into memory for cache
        address[] memory cachedVault = memes;
//        mapping(address => MemeVault) memory cacheVault = vaults;
        uint256 count = cachedVault.length;
        for (uint256 i = 0; i < count; i++) {
            MemeVault vault = vaults[cachedVault[i]];
            if (vault.shouldSwap()) {
                swap.swapStableCoinWithMeme(2);
            }
        }

    }

}
