// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ZombieFactory {

    event NewZombie(uint zombieId,string name,uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function ZombiesLength() public view returns(uint256){
        return zombies.length;
    }
    /*
    view 상태변수를 사용은 합니다. 값을 바꾸지 않을 경우에만
    pure 상태변수를 사용도 안하고
    상태변수를 return 하거나 혹은 내용을 바꿀때
     */

    function _createZombie(string memory _name, uint _dna) public {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.length -1;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) public view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

      function createRandomZombie(string memory _name) public{
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name,randDna);
    }

}
