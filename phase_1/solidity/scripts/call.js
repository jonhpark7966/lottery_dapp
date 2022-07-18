async function main() {
    const contractAddress = "0x36DF33c57fb1FA3f37C407CdDc247B59822A72df";
    const myContract = await hre.ethers.getContractAt("LotteryPhase1", contractAddress);

    const accounts = await ethers.provider.listAccounts();
    console.log("Accounts:", accounts);

    const drawTime = await myContract.drawTime();
    console.log("DrawTime: ", drawTime);

    totalAmount = await myContract.totalAmount();
    console.log("Total Amount: ", totalAmount);

    //const receive = await myContract.buyticket({value: ethers.utils.parseEther("0.0001"), from:accounts[0]});
    //console.log("Receive from 1: ", receive);

    totalAmount = await myContract.totalAmount();
    console.log("Total Amount: ", totalAmount);

    const draw = await myContract.draw();
    console.log("Draw(): ", draw);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });