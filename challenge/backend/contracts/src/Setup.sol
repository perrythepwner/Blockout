// SPDX-License-Identifier: MIT

pragma solidity ^0.8.29;

import { VCNK } from "./VCNK.sol";

contract Setup {
    VCNK public TARGET;
    address public player;

    event DeployedTarget(address at);

    constructor(address _player) {
        TARGET = new VCNK();
        player = _player;
        emit DeployedTarget(address(TARGET));
    }

    function isSolved() public view returns (bool) {
        uint8 CU_STATUS_EMERGENCY = 3;
        (uint8 status, , ,) = TARGET.controlUnit();
        return status == CU_STATUS_EMERGENCY;
    }
}
