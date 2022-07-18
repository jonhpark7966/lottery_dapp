
/////

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const ONE_HOUR_IN_SECS = 60 * 60;
  const drawTime = currentTimestampInSeconds + ONE_HOUR_IN_SECS;

  const Lottery = await hre.ethers.getContractFactory("LotteryPhase1");
  const contract = await Lottery.deploy(drawTime);
  await contract.deployed();
  console.log("Contract address is:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});