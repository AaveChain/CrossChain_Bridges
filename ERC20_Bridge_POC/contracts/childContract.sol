// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Contract Imports */

//Remix style import
import { ERC20 } from "@openzeppelin/contracts@4.0.0/token/ERC20/ERC20.sol";
import { ERC20Burnable } from "@openzeppelin/contracts@4.0.0/token/ERC20/extensions/ERC20Burnable.sol";


contract TokenChild is ERC20, ERC20Burnable {
    
    address bridge;

    constructor (address _bridge) ERC20("ImperialsCreditsChild", "ICR") {
        bridge = _bridge;
    }


    function mint(address recipient, uint256 amount) public virtual onlyBridge{
        _mint(recipient, amount);
    }


    function burn(uint256 amount) public override (ERC20Burnable) virtual onlyBridge{
        super.burn(amount);
    }


    function burnFrom(address account, uint256 amount) public override(ERC20Burnable) virtual onlyBridge{
        super.burnFrom(account, amount);
    }

    modifier onlyBridge {
      require(msg.sender == bridge, "only bridge has access to this child token function");
      _;
    }

}