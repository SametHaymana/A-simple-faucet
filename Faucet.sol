
pragma solidity ^0.8.14;

contract faucet {


    mapping(address => uint) private lastTransfers;
    uint amount = 10 ** 18 * 0.2;

    function requestTokens(address payable requestor) external {
        require(address(this).balance >= amount, "Not enough funds in the faucet. Please donate");
        require(lastTransfers[requestor] + 3600 <= block.timestamp, "Patience is a virtue. You already requested funds hour ago");
        requestor.transfer(amount);
        lastTransfers[requestor] = block.timestamp;
  
    }

    receive() external payable{}

}
