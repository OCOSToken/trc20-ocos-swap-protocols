// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Snapshot Verifier
/// @notice This contract verifies eligibility of OCOS TRC-20 users based on SHA256 snapshot hashes approved by the DAO
contract OcosSnapshotVerifier {
    mapping(address => bytes32) public snapshotHashes;
    address public dao;

    modifier onlyDAO() {
        require(msg.sender == dao, "Not DAO");
        _;
    }

    event SnapshotVerified(address indexed user, bytes32 hash);

    constructor(address _dao) {
        require(_dao != address(0), "Invalid DAO address");
        dao = _dao;
    }

    /// @notice Sets the snapshot hash for a verified user
    /// @param user The wallet address of the user
    /// @param hash The SHA256 hash of the user's snapshot record
    function verifySnapshot(address user, bytes32 hash) external onlyDAO {
        require(user != address(0), "Invalid address");
        require(hash != 0, "Invalid hash");
        snapshotHashes[user] = hash;
        emit SnapshotVerified(user, hash);
    }

    /// @notice Checks whether a user's hash matches the recorded snapshot
    /// @param user The wallet address to check
    /// @param hash The hash to verify against the recorded one
    /// @return True if the user is eligible (hash match), false otherwise
    function isEligible(address user, bytes32 hash) external view returns (bool) {
        return snapshotHashes[user] == hash;
    }

    /// @notice Allows the DAO to transfer control to a new DAO address
    /// @param newDao The new DAO controller address
    function updateDAO(address newDao) external onlyDAO {
        require(newDao != address(0), "Invalid DAO address");
        dao = newDao;
    }
}
