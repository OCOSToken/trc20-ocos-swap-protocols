// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OCOS Burn Tracker
/// @notice Tracks and logs all OCOS token burn events for audit and DAO transparency
contract OcosBurnTracker {
    mapping(address => uint256) public totalBurned;
    address public vault;

    modifier onlyVault() {
        require(msg.sender == vault, "Only vault contract can call this function");
        _;
    }

    constructor(address _vault) {
        require(_vault != address(0), "Invalid vault address");
        vault = _vault;
    }

    /// @notice Logs a burn event and updates total burned tokens for the user
    /// @param user Address of the user who redeemed OCOS
    /// @param amount Amount of OCOS burned
    function logBurn(address user, uint256 amount) external onlyVault {
        require(user != address(0), "Invalid user address");
        require(amount > 0, "Amount must be greater than zero");

        totalBurned[user] += amount;
        emit Burned(user, amount);
    }

    /// @notice Retrieves total OCOS burned by a specific user
    /// @param user Address of the user
    /// @return uint256 Total amount burned by the user
    function getTotalBurned(address user) external view returns (uint256) {
        return totalBurned[user];
    }

    event Burned(address indexed user, uint256 amount);
}
