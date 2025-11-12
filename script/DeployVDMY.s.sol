pragma solidity ^0.8.0;

import {VDMYtoken} from "../src/VDMYtoken.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "forge-std/console.sol";
contract DeployVDMY is Script {
    function run() public {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        address owner = vm.envAddress("TOKEN_OWNER");
        vm.startBroadcast(pk);

        VDMYtoken token = new VDMYtoken();
        uint8 decimals = token.decimals();
        token.mint(owner, 10000000 * 10 * decimals);

        token.transferOwnership(owner);

        console.log("total supply", token.totalSupply());
        vm.stopBroadcast();

    }

}