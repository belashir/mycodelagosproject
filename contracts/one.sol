// https://medium.freecodecamp.org/how-to-write-and-deploy-your-first-smart-contract-341d5e2ffb35


pragma solidity >0.4.23; //tells that the source code is written for Solidity version 0.4.23 or anything newer that does not break functionality


contract yourToken {
    // The keyword "public" makes those variables readable from outside.
    
    address public minter;
    
    // Events allow light clients to react on changes efficiently.
    mapping (address => uint) public balances;
    
    // This is the constructor whose code is run only when the contract is created
    event Sent(address from, address to, uint amount);
    
    function youToken() public {
        
        minter = msg.sender;
        
    }
    
    function mint(address receiver, uint amount) public {
        
        if(msg.sender != minter) return;
        balances[receiver]+=amount;
        
    }
    
    function send(address receiver, uint amount) public {
        if(balances[msg.sender] < amount) return;
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit Sent(msg.sender, receiver, amount);
        
    }
       
}