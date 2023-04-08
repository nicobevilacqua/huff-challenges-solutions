// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

contract Challenge2Test is Test {
    address private challenge;

    function setUp() external {
        challenge = HuffDeployer.config().deploy("Challenge2");
    }

    function test_Challenge_even() external {
        (bool success, bytes memory response) = challenge.staticcall(
            abi.encode(2)
        );
        require(success);
        bool isEven = abi.decode(response, (bool));
        assertTrue(isEven);
    }

    function test_Challenge_odd() external {
        (bool success, bytes memory response) = challenge.staticcall(
            abi.encode(1)
        );
        require(success);
        bool isEvenResponse = abi.decode(response, (bool));
        assertFalse(isEvenResponse);
    }

    function test_fuzzing_Challenge(uint256 number) external {
        bool isEven = number % 2 == 0;
        (bool success, bytes memory response) = challenge.staticcall(
            abi.encode(number)
        );
        require(success);
        bool isEvenResponse = abi.decode(response, (bool));
        assertEq(isEvenResponse, isEven);
    }
}
