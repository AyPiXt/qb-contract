**Note: This script is not ready for immediate use.**

** Currently, it only works with qb-inputs, but I plan to update it to use ox libs in the future.I drew inspiration from **"Kaiz"** and his contract script, creating my own version. Currently, it only works with qb-inputs, but I plan to update it to use ox libs in the future.**

**Dependencies:**

- [qb-core](https://github.com/qbcore-framework/qb-core "qb-core")
- [qb-input](https://github.com/qbcore-framework/qb-input "qb-input")

**Installation:**

Rename the folder from **qb-contract-main** to **qb-contract**.
Add the following line to qb-core/shared/items.lua:


```lua
carcontract = { name = 'carcontract', label = 'Fahrzeug-Dokument', weight = 1, type = 'item', image = 'contract.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Ein Verkaufsvertrag für Fahrzeuge' },
```

**Note:**
If you don't have an image for the contract (contract.png), add it to your inventory.

Feel free to contribute and improve this script. If you encounter any issues, please create an issue in the repository.
