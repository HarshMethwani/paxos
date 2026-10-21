// SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

import {
    PendleRouterDecoderAndSanitizer,
    BaseDecoderAndSanitizer
} from "./Protocols/PendleRouterDecoderAndSanitizer.sol";
import {
    UniswapV3DecoderAndSanitizer
} from "./Protocols/UniswapV3DecoderAndSanitizer.sol";
import {
    UniswapUniversalStablecoinDecoderAndSanitizer
} from "./Protocols/UniswapUniversalStablecoinDecoderAndSanitizer.sol";
import { OneInchDecoderAndSanitizer } from "./Protocols/OneInchDecoderAndSanitizer.sol";
import { CurveDecoderAndSanitizer } from "./Protocols/CurveDecoderAndSanitizer.sol";
import {
    NativeWrapperDecoderAndSanitizer
} from "./Protocols/NativeWrapperDecoderAndSanitizer.sol";
import { ERC4626DecoderAndSanitizer } from "./Protocols/ERC4626DecoderAndSanitizer.sol";
import { EigenpieDecoderAndSanitizer } from "./Protocols/EigenpieDecoderAndSanitizer.sol";
import { PirexEthDecoderAndSanitizer } from "./Protocols/PirexEthDecoderAndSanitizer.sol";
import { AaveV3DecoderAndSanitizer } from "./Protocols/AaveV3DecoderAndSanitizer.sol";
import {
    VelodromeV1DecoderAndSanitizer
} from "./Protocols/VelodromeV1DecoderAndSanitizer.sol";
import {
    FlashHypeDecoderAndSanitizer
} from "./Protocols/FlashHypeDecoderAndSanitizer.sol";
import { CircleDecoderAndSanitizer } from "./Protocols/CircleDecoderAndSanitizer.sol";
import {
    BalancerV2DecoderAndSanitizer
} from "./Protocols/BalancerV2DecoderAndSanitizer.sol";
import {
    MorphoBlueDecoderAndSanitizer
} from "./Protocols/MorphoBlueDecoderAndSanitizer.sol";
import { EtherFiDecoderAndSanitizer } from "./Protocols/EtherFiDecoderAndSanitizer.sol";
import {
    LayerZeroOFTDecoderAndSanitizer
} from "./Protocols/LayerZeroOFTDecoderAndSanitizer.sol";
import { PxlDecoderAndSanitizer } from "./Protocols/PxlDecoderAndSanitizer.sol";
import {
    CoreWriterDecoderAndSanitizer
} from "./Protocols/CoreWriterDecoderAndSanitizer.sol";
import { KhalaniDecoderAndSanitizer } from "./Protocols/KhalaniDecoderAndSanitizer.sol";
import { SkyDecoderAndSanitizer } from "./Protocols/SkyDecoderAndSanitizer.sol";

contract GenericDecoderAndSanitizer is
    PendleRouterDecoderAndSanitizer,
    UniswapV3DecoderAndSanitizer,
    UniswapUniversalStablecoinDecoderAndSanitizer,
    OneInchDecoderAndSanitizer,
    CurveDecoderAndSanitizer,
    NativeWrapperDecoderAndSanitizer,
    ERC4626DecoderAndSanitizer,
    EigenpieDecoderAndSanitizer,
    PirexEthDecoderAndSanitizer,
    AaveV3DecoderAndSanitizer,
    VelodromeV1DecoderAndSanitizer,
    FlashHypeDecoderAndSanitizer,
    CircleDecoderAndSanitizer,
    BalancerV2DecoderAndSanitizer,
    MorphoBlueDecoderAndSanitizer,
    EtherFiDecoderAndSanitizer,
    LayerZeroOFTDecoderAndSanitizer,
    PxlDecoderAndSanitizer,
    CoreWriterDecoderAndSanitizer,
    KhalaniDecoderAndSanitizer,
    SkyDecoderAndSanitizer
{

    constructor(
        address _boringVault,
        address _uniswapV3NonFungiblePositionManager
    )
        BaseDecoderAndSanitizer(_boringVault)
        UniswapV3DecoderAndSanitizer(_uniswapV3NonFungiblePositionManager)
    { }

    function deposit(
        uint256,
        address receiver
    )
        external
        pure
        override(CurveDecoderAndSanitizer, ERC4626DecoderAndSanitizer, BalancerV2DecoderAndSanitizer)
        returns (bytes memory addressesFound)
    {
        addressesFound = abi.encodePacked(receiver);
    }

    function withdraw(uint256)
        external
        pure
        override(CurveDecoderAndSanitizer, NativeWrapperDecoderAndSanitizer, BalancerV2DecoderAndSanitizer)
        returns (bytes memory addressesFound)
    {
        // Nothing to sanitize or return
        return addressesFound;
    }

    function deposit()
        external
        pure
        virtual
        override(NativeWrapperDecoderAndSanitizer, EtherFiDecoderAndSanitizer)
        returns (bytes memory addressesFound)
    {
        // Nothing to sanitize or return
        return addressesFound;
    }

}
