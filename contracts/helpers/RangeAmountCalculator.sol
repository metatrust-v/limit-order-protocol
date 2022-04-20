// SPDX-License-Identifier: MIT

pragma solidity 0.8.11;
pragma abicoder v1;

import "@openzeppelin/contracts/utils/Address.sol";

contract RangeAmountCalculator {
    using Address for address;

    function getRangeMakerAmount(
        uint256 priceStart,
        uint256 priceEnd,
        uint256 totalLiquidity,
        uint256 filledFor,
        uint256 fillAmount
    ) public pure returns(uint256) {
        uint256 remainingLiquidity = totalLiquidity - filledFor;
        uint256 filledForAfterFill = filledFor + fillAmount;
        uint256 remainingLiquidityAfterFill = remainingLiquidity - fillAmount;

        uint256 amountBeforeFill = priceStart * remainingLiquidity + priceEnd * filledFor;
        uint256 amountAfterFill = priceStart * remainingLiquidityAfterFill + priceEnd * filledForAfterFill;

        return fillAmount * (amountBeforeFill + amountAfterFill) / totalLiquidity / 2;
    }
}
