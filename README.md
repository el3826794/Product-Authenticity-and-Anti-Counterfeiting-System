# Product Authenticity and Anti-Counterfeiting System

A comprehensive blockchain-based system for verifying the authenticity of luxury goods and branded products, built on the Stacks blockchain using Clarity smart contracts.

## Overview

This system provides a complete solution for product authenticity verification, anti-counterfeiting measures, and supply chain transparency. It enables brands to register products, consumers to verify authenticity, and provides comprehensive tracking throughout the product lifecycle.

## Features

### Core Functionality
- **Product Registration**: Brands can register authentic products with unique identifiers
- **Authenticity Verification**: Consumers can verify product authenticity using product codes
- **Provenance Tracking**: Complete history of product ownership and transfers
- **Brand Management**: Authorized brand registration and management system
- **Warranty Management**: Digital warranty tracking and validation
- **Anti-Counterfeiting**: Counterfeit reporting and tracking system

### Key Benefits
- Reduces counterfeit products in the market
- Provides consumers with confidence in product authenticity
- Enables brands to protect their reputation and revenue
- Supports warranty and after-sales service management
- Reduces returns and disputes over authenticity
- Creates transparent supply chain visibility

## Smart Contracts

### 1. Brand Registry Contract (\`brand-registry.clar\`)
- Manages authorized brand registration
- Controls brand permissions and verification
- Handles brand profile management

### 2. Product Registry Contract (\`product-registry.clar\`)
- Registers authentic products with unique identifiers
- Manages product metadata and specifications
- Tracks product lifecycle and status

### 3. Authenticity Verifier Contract (\`authenticity-verifier.clar\`)
- Provides product authenticity verification
- Manages verification requests and responses
- Tracks verification history

### 4. Warranty Manager Contract (\`warranty-manager.clar\`)
- Manages digital warranties for products
- Tracks warranty status and claims
- Handles warranty transfers with ownership

### 5. Anti-Counterfeiting Tracker Contract (\`anti-counterfeiting-tracker.clar\`)
- Tracks counterfeit reports and investigations
- Manages counterfeit product database
- Provides analytics on counterfeiting trends

## Data Structures

### Product Information
- Unique product identifier (hash-based)
- Brand information and authorization
- Product specifications and metadata
- Manufacturing details and batch information
- Current ownership and transfer history

### Brand Information
- Brand registration details
- Authorization status and permissions
- Contact information and verification
- Product categories and specializations

### Warranty Information
- Warranty terms and duration
- Purchase date and retailer information
- Warranty status and claim history
- Transfer conditions and restrictions

## Security Features

- Multi-signature brand authorization
- Cryptographic product identification
- Immutable ownership records
- Secure transfer mechanisms
- Anti-tampering measures

## Usage Scenarios

### For Brands
1. Register as an authorized brand
2. Register authentic products with unique identifiers
3. Track product distribution and sales
4. Monitor for counterfeit reports
5. Manage warranties and customer service

### For Consumers
1. Verify product authenticity using product codes
2. Check product provenance and history
3. Access warranty information and status
4. Report suspected counterfeit products
5. Transfer ownership with warranty

### For Retailers
1. Verify products before sale
2. Provide authenticity certificates to customers
3. Access product information and specifications
4. Handle warranty claims and transfers

## Installation and Setup

1. Install Clarinet for local development
2. Clone the repository
3. Run tests using Vitest
4. Deploy contracts to Stacks blockchain

## Testing

The system includes comprehensive tests covering:
- Brand registration and management
- Product registration and verification
- Authenticity checking mechanisms
- Warranty management and transfers
- Anti-counterfeiting tracking
- Error handling and edge cases

## API Reference

### Brand Registry
- \`register-brand\`: Register a new authorized brand
- \`verify-brand\`: Check brand authorization status
- \`update-brand-info\`: Update brand information

### Product Registry
- \`register-product\`: Register a new authentic product
- \`get-product-info\`: Retrieve product information
- \`transfer-ownership\`: Transfer product ownership

### Authenticity Verifier
- \`verify-authenticity\`: Verify product authenticity
- \`get-verification-history\`: Get verification records
- \`report-counterfeit\`: Report suspected counterfeit

### Warranty Manager
- \`create-warranty\`: Create warranty for product
- \`check-warranty-status\`: Check warranty validity
- \`claim-warranty\`: Process warranty claim

### Anti-Counterfeiting Tracker
- \`report-counterfeit\`: Report counterfeit product
- \`track-investigation\`: Track counterfeit investigation
- \`get-counterfeit-stats\`: Get counterfeiting statistics

## Contributing

Please read the contributing guidelines and ensure all tests pass before submitting pull requests.

## License

This project is licensed under the MIT License.
