const TokenCustomDecimalsMock = artifacts.require('TokenCustomDecimalsMock');

describe('Temp test', async () => {
    before(async () => {
        this.chainId = await web3.eth.getChainId();

        const tokenCustomDecimalsMock = await TokenCustomDecimalsMock.new("NAME", "SYMBOL", '0', 18);
        console.log("!!!", (await tokenCustomDecimalsMock.decimals()).toString());
    });

    describe('Something', async () => {
        it('test', async () => {
            console.log(this.chainnId);
        });
    });
});
