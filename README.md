# smart-contracts
This repository contains solidity based smart contracts to demonstrate storage and retrieval of data on the Ethereum blockchain.

## It primarily consists of three core contracts:
### 1. SimpleStorage(SimpleStorage.sol)
   This contract manages the storage of a single number variable and people's favorite numbers and names on the blockchain.It 
   exposes functionality to:

      - Store a favorite number that can be retrieved
      - Map the stored numbers to associated string names
      - Maintain a list of people structures with a favorite number and name for each person
      - Retrieve the stored favorite number for a person based on their name

### 2. StorageFactory(StorageFactory.sol)
   This contract helps deploy and manage multiple SimpleStorage contract instances by providing following functions:

      - Deploy new SimpleStorage contracts
      - Interact with each deployed contract instance by calling their respective functions
      
### 3. ExtraStorage(ExtraStorage.sol)
   This contract inherits from the SimpleStorage contract and provides additional functionality for storing numbers.It has the 
   ability to:

      - Override the store function from its parent SimpleStorage contract
      - Perform a custom logic by incrementing the input number before storing

### 4. FundMe (FundMe.sol)
   This smart contract facilitates crowdfunding by allowing users to contribute Ether. It enforces a minimum funding threshold denominated in USD and utilizes an 
   external price feed to determine Ether's USD value. Key functionalities include:

      - Fund(): Enables users to contribute Ether to the contract, ensuring that the amount sent meets or exceeds the specified minimum funding threshold.
      - withdraw(): Withdraws funds from the contract to the owner's account, ensuring only the contract owner can execute this action.
    
### 4. FundMeLibrary (FundMeLibrary.sol)
   This library facilitates crowdfunding by allowing users to contribute Ether. It enforces a minimum funding threshold denominated in USD and utilizes an external 
   price feed to determine Ether's USD value. Key functionalities include:

      - getPrice(): Retrieves the latest price of Ether in USD from an external price feed.
      - getVersion(): Provides the version of the price feed contract being utilized.
      - getConversionRate(uint256 ethAmount): Calculates the conversion rate of Ether to USD based on the amount of Ether provided.
      
   #### Note: This contract's features rely on being connected to a simulated wallet environment for testing purposes.
