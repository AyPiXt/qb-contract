
**README**

**Note: This script is not ready for immediate use.**

I drew inspiration from "Kaiz" and his contract script, creating my own version. Currently, it only works with qb-inputs, but I plan to update it to use ox libs in the future.

**Dependencies:**

qb-core
qb-input

''Installation:**

Rename the folder from **qb-contract-main** to **qb-contract**.
Add the following line to **qb-core/shared/items.lua**:

```carcontract = { name = 'carcontract', label = 'Carcontract', weight = 1, type = 'item', image = 'contract.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Contract for Cars' },```
**Note:**
If you don't have an image for the contract (contract.png), add it to your inventory.

Feel free to contribute and improve this script. If you encounter any issues, please create an issue in the repository.
