// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";




contract BoxV1 is Initializable,UUPSUpgradeable,OwnableUpgradeable{
    uint256 internal number;


    // constructor(){
    //     _disableInitializers();
    // }

    function initialize(uint256 _x) public initializer{
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
        // __

    }


       function addNumber( )public{
        number += number + uint256(7);
    }



    function getNumber() external view returns(uint256){
        return number;
    }

    function getVersion() external pure returns(uint256){
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override{

    }
}

