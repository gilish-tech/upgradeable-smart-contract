# 📦 Box Upgradeable Smart Contract (UUPS Pattern)

This project demonstrates how to build and manage **upgradeable smart contracts** using the **UUPS (Universal Upgradeable Proxy Standard)** pattern with OpenZeppelin. It consists of a simple contract, **BoxV1**, which allows storing and modifying a number, with support for future upgrades.

---

## 🛠 Features

- **Upgradeable with UUPS Proxy:**  
  Enables contract upgrades without losing state.
- **Owner-based Access Control:**  
  Only the owner can authorize upgrades using `_authorizeUpgrade()`.
- **Modular Initialization:**  
  Uses `Initializable` to replace the constructor logic.
- **Supports Versioning:**  
  Each version has a dedicated `getVersion()` function to track deployed versions.

---

## 📂 Project Structure

```text
│
├── contracts/
│   ├── BoxV1.sol       # Initial version of the contract
│   ├── BoxV2.sol       # Future upgrade (extend BoxV1 with new features)
│
├── test/
│   └── BoxTest.t.sol   # Foundry test suite for upgrade and function testing
│
├── README.md           # Project documentation
├── foundry.toml        # Foundry config file
