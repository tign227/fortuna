// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {IVault} from "./interface/IVault.sol";
import {ITokenVault} from "./interface/ITokenVault.sol";
import  {MemeVault} from "./MemeVault.sol";

contract Fortuna is IVault {

    mapping(address => MemeVault) public vaults;

    function create(address _token) virtual external {
        ITokenVault vault = vaults[_token];
        require(address(vault) == address(0), "Token already supported");
        vaults[_token] = new MemeVault(_token);
    }

    function depositMeme(address _token, uint256 _amount)  external {
        ITokenVault vault = vaults[_token];
        require(address(vault)!= address(0), "Token not supported");
        vault.deposit(_amount);
    }

    function withdrawMeme(address _token, uint256 _amount)  external {
        ITokenVault vault = vaults[_token];
        require(address(vault)!= address(0), "Token not supported");
        vault.withdraw(_amount);
    }

}
