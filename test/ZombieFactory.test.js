const ZombieFactory = artifacts.require("ZombieFactory");

describe("ZombieFactory", () => {
  let deployed;

  it("Get Deployed", async () => {
    deployed = await ZombieFactory.deployed();
    console.log(deployed);
  });
  it("_createZombie", async () => {
    await deployed._createZombie("help", 111111);

    const arr = await deployed.zombies.call(0);
    console.log(arr.name, arr.dna.toNumber());
  });

  it("_generateRanmdomDna", async () => {
    const dna = await deployed._generateRandomDna("help");
    console.log(parseInt(dna.toString()));
  });
  it("createRandomZombie", async () => {
    await deployed.createRandomZombie("help");
    const arr = await deployed.zombies.call(0);
    console.log(arr.name, arr.dna.toString());
  });
});
