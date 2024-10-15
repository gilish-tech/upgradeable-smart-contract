// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {Constants} from "./Constants.sol";


contract UpgradeBox is Script {
    function run() external  returns(address) {
        Constants constants = new Constants();
        address recentProxy = vm.envAddress(constants.PROXY_ADDRESS_NAME());
        vm.startBroadcast();
        BoxV2 box = new BoxV2();
        address proxy = upgradeBox(recentProxy,address(box));
        return proxy;
      

    }

    function upgradeBox(address proxyAddress, address newBox) public returns(address){
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(proxyAddress);
        proxy.upgradeToAndCall(address(newBox),"");
        
        vm.stopBroadcast();
        return address(proxy);

    }
}