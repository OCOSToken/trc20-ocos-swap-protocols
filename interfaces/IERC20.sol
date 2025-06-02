// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OCOS Redeem Vault
/// @notice Enables TRC-20 OCOS token redemption for USDT with token burn and DAO recording
contract OcosRedeemVault {
    address public ocosToken;
    address public usdtToken;
    address public dao;
    address public burnTracker;

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

    function updateRate(uint256 newRate) external onlyDAO {
        redeemRate = newRate;
    }

    function redeem(uint256 ocosAmount) external {
        require(ocosAmount > 0, "Invalid amount");
        uint256 usdtAmount = (ocosAmount * redeemRate) / 1e18;

        require(IERC20(ocosToken).transferFrom(msg.sender, address(this), ocosAmount), "Transfer failed");
        require(IERC20(usdtToken).transfer(msg.sender, usdtAmount), "USDT transfer failed");

        IBurnTracker(burnTracker).logBurn(msg.sender, ocosAmount);

        IERC20(ocosToken).transfer(address(0), ocosAmount); // Burn
        emit Redeemed(msg.sender, ocosAmount, usdtAmount);
    }

    event Redeemed(address indexed user, uint256 ocosAmount, uint256 usdtAmount);
}

/// @title Burn Tracker
contract OcosBurnTracker {
    mapping(address => uint256) public totalBurned;
    address public vault;

    modifier onlyVault() {
        require(msg.sender == vault, "Only vault");
        _;
    }

    constructor(address _vault) {
        vault = _vault;
    }

    function logBurn(address user, uint256 amount) external onlyVault {
        totalBurned[user] += amount;
        emit Burned(user, amount);
    }

    event Burned(address indexed user, uint256 amount);
}

/// @title Snapshot Verifier
contract OcosSnapshotVerifier {
    mapping(address => bytes32) public snapshotHashes;
    address public dao;

    modifier onlyDAO() {
        require(msg.sender == dao, "Not DAO");
        _;
    }

    constructor(address _dao) {
        dao = _dao;
    }

    function verifySnapshot(address user, bytes32 hash) external onlyDAO {
        snapshotHashes[user] = hash;
    }

    function isEligible(address user, bytes32 hash) external view returns (bool) {
        return snapshotHashes[user] == hash;
    }
}

/// @title DAO Ledger
contract OcosDaoLedger {
    struct RedeemRecord {
        address user;
        uint256 ocosAmount;
        uint256 usdtAmount;
        uint256 timestamp;
    }

    RedeemRecord[] public ledger;
    address public vault;

    modifier onlyVault() {
        require(msg.sender == vault, "Not vault");
        _;
    }

    constructor(address _vault) {
        vault = _vault;
    }

    function recordRedeem(address user, uint256 ocos, uint256 usdt) external onlyVault {
        ledger.push(RedeemRecord(user, ocos, usdt, block.timestamp));
        emit Recorded(user, ocos, usdt);
    }

    event Recorded(address indexed user, uint256 ocosAmount, uint256 usdtAmount);
}

/// @notice Minimal ERC-20 interface
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IBurnTracker {
    function logBurn(address user, uint256 amount) external;
}
