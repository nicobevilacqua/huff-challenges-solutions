// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

// import {IPool} from "src/interfaces/IPool.sol";

contract Challenge1Test is Test {
    address private challenge;

    function setUp() external {
        challenge = HuffDeployer.config().deploy("Challenge1");
    }

    function test_Challenge() external {
        uint256 blockNumber = 1;
        vm.roll(blockNumber);
        (bool success, bytes memory response) = challenge.staticcall("");
        require(success);
        uint256 responseBlockNumber = abi.decode(response, (uint256));
        assertEq(blockNumber, responseBlockNumber);
    }

    function test_fuzzing_Challenge(uint256 blockNumber) external {
        vm.roll(blockNumber);
        (bool success, bytes memory response) = challenge.staticcall("");
        require(success);
        uint256 responseBlockNumber = abi.decode(response, (uint256));
        assertEq(blockNumber, responseBlockNumber);
    }
}
