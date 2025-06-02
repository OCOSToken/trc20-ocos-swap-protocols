// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OCOS Redeem Vault
/// @notice Enables TRC-20 OCOS token redemption for USDT with token burn and DAO recording
contract OcosRedeemVault {
    address public ocosToken;
    address public usdtToken;
    address public dao;
    address public burnTracker;
    address public daoLedger;

    uint256 public redeemRate = 35e13; // 0.035 USDT per 1 OCOS (18 decimals)

    modifier onlyDAO() {
        require(msg.sender == dao, "Not authorized");
        _;
    }

    constructor(address _dao) {
        dao = _dao;
    }

    function setOcosAddress(address _ocos) external onlyDAO {
        ocosToken = _ocos;
    }

    function setUsdtAddress(address _usdt) external onlyDAO {
        usdtToken = _usdt;
    }

    function setBurnTracker(address _tracker) external onlyDAO {
        burnTracker = _tracker;
    }

    function setDaoLedger(address _ledger) external onlyDAO {
        daoLedger = _ledger;
    }

    function updateRate(uint256 newRate) external onlyDAO {
        redeemRate = newRate;
    }

    function redeem(uint256 ocosAmount) external {
        require(ocosAmount > 0, "Invalid amount");
        uint256 usdtAmount = (ocosAmount * redeemRate) / 1e18;

        require(IERC20(ocosToken).transferFrom(msg.sender, address(this), ocosAmount), "Transfer failed");
        require(IERC20(usdtToken).transfer(msg.sender, usdtAmount), "USDT transfer failed");

        IBurnTracker(burnTracker).logBurn(msg.sender, ocosAmount);
        IDaoLedger(daoLedger).recordRedeem(msg.sender, ocosAmount, usdtAmount);

        IERC20(ocosToken).transfer(address(0), ocosAmount); // Burn
        emit Redeemed(msg.sender, ocosAmount, usdtAmount);
    }

    event Redeemed(address indexed user, uint256 ocosAmount, uint256 usdtAmount);
}

/// @notice Minimal ERC-20 interface
interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
}

interface IBurnTracker {
    function logBurn(address user, uint256 amount) external;
}

interface IDaoLedger {
    function recordRedeem(address user, uint256 ocos, uint256 usdt) external;
}
