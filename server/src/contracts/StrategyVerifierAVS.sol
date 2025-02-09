interface IBrevis {
    function verifyProof(bytes calldata proof) external returns (bool);
}

contract StrategyVerifierAVS {
    IBrevis public brevis = IBrevis(0xwwwwwwwwwwwwwww);
    
    function validateStrategy(bytes memory strategy, bytes memory proof) public {
        require(brevis.verifyProof(proof), "Invalid Brevis proof");
        (uint256 memecoinAllocation, uint256 totalAllocation) = abi.decode(strategy, (uint256, uint256));
        
        // Check memecoin allocation is within safe limits (max 20%)
        require(memecoinAllocation * 100 / totalAllocation <= 20, "Memecoin allocation exceeds 20% limit");
        
    }
}