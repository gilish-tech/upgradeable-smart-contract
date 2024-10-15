// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/Upgradeable.s.sol";
import {Test,console} from "forge-std/Test.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";


contract DeployAndUpgrade is Test{
    DeployBox public deployer;
    UpgradeBox public upgrader;
    address public OWNER = makeAddr("owner");
    address public proxy;


    function setUp() public{
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.run();
    
    }
    

    function testIfRevertIftheSetValueFunctionIsCalledBeforeUpgrade()external{
        BoxV1 boxV1 = BoxV1(proxy);
        boxV1.addNumber();
        assertEq(1,BoxV1(address(proxy)).getVersion());
        assertEq(7,BoxV1(address(proxy)).getNumber());

    }
    function testUpgrade() public{
        BoxV2 boxV2 = new BoxV2();
        assertEq(1,BoxV1(address(proxy)).getVersion());
        proxy = upgrader.upgradeBox(proxy,address(boxV2));
        uint256 expectedVersion = 2;
        assertEq(BoxV1(address(proxy)).getVersion(),expectedVersion);


        
         

    }

    function testcheckIfFuctionIsAdded()external{
         BoxV2 boxV2 = new BoxV2();
        proxy = upgrader.upgradeBox(proxy,address(boxV2));
        uint256  expectedValue = 100;
        BoxV2(address(proxy)).setNumber(expectedValue);
        // BoxV2(address(proxy)).addNumber();
        assertEq(BoxV1(address(proxy)).getNumber(),expectedValue );

    }
}