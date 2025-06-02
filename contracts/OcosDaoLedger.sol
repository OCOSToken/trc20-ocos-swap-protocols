// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OCOS DAO Ledger
/// @notice Records all OCOS redemption operations with on-chain traceability for DAO auditing and historical validation
contract OcosDaoLedger {
    
    /// @notice Redemption transaction record structure
    struct RedeemRecord {
        address user;
        uint256 ocosAmount;
        uint256 usdtAmount;
        uint256 timestamp;
    }

    /// @notice List of all recorded redeems
    RedeemRecord[] public ledger;

    /// @notice Address authorized to write (usually OcosRedeemVault)
    address public vault;

    /// @notice Emitted every time a redeem is recorded
    event Recorded(address indexed user, uint256 ocosAmount, uint256 usdtAmount, uint256 timestamp);

    /// @notice Ensures only vault contract can call sensitive functions
    modifier onlyVault() {
        require(msg.sender == vault, "Unauthorized: caller is not vault");
        _;
    }

    /// @param _vault Contract authorized to submit records
    constructor(address _vault) {
        require(_vault != address(0), "Invalid vault address");
        vault = _vault;
    }

    /// @notice Records a new redemption
    /// @param user Wallet address
    /// @param ocos Amount of OCOS redeemed
    /// @param usdt Equivalent USDT paid
    function recordRedeem(address user, uint256 ocos, uint256 usdt) external onlyVault {
        RedeemRecord memory record = RedeemRecord({
            user: user,
            ocosAmount: ocos,
            usdtAmount: usdt,
            timestamp: block.timestamp
        });
        ledger.push(record);
        emit Recorded(user, ocos, usdt, block.timestamp);
    }

    /// @notice Returns total number of recorded redeems
    function totalRecords() external view returns (uint256) {
        return ledger.length;
    }

    /// @notice Returns a specific record by index
    function getRecord(uint256 index) external view returns (RedeemRecord memory) {
        require(index < ledger.length, "Index out of bounds");
        return ledger[index];
    }
}
