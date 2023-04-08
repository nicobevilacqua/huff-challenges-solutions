// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

interface Challenge3 {
    function deposit() external payable;

    function withdraw() external;

    function setWithdrawer(address) external payable;
}

contract Challenge3Test is Test {
    address challengeAddress = 0xae7e201257f3F7918E9e8F2F3De998E3D75f7A1d;

    address private challenge;

    function setUp() external {
        // challenge = Challenge3(HuffDeployer.deploy("Challenge3"));
    }

    function test_Challenge() external {}
}
