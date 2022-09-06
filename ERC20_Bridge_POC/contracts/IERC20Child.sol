// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Remix style import
import { IERC20 } from "@openzeppelin/contracts@4.0.0/token/ERC20/IERC20.sol";


// Interface of the child ERC20 token, for use on sidechains and L2 networks.
interface IERC20Child is IERC20 {
  /**
   * called by bridge gateway when tokens are deposited on root chain
   * Should handle deposits by minting the required amount for the recipient
   *
   * recipient an address for whom minting is being done
   * amount total amount to mint
   */
  function mint(
    address recipient,
    uint256 amount
  )
    external;

  /**
   * called by bridge gateway when tokens are withdrawn back to root chain
   * Should burn recipient's tokens.
   *
   * amount total amount to burn
   */
  function burn(
    uint256 amount
  )
    external;

  /**
   *
   * account an address for whom burning is being done
   * amount total amount to burn
   */
  function burnFrom(address account, uint256 amount) external;
}

