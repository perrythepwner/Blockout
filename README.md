# Blockout

<p align="center">
    <img src="./assets/ChallengeBanner.png" height="800" />
    <br />
    ---
    <br />
    <img src="./assets/EventBanner.jpg" />
</p>

15<sup>th</sup> Mar 2024 \
Prepared By: perrythepwner \
Challenge Author(s): **perrythepwner** \
Difficulty: <font color=orange>Medium</font>

---

# TLDR
The `VCNKv2` contract acts as a Factory Contract for "compatible" gateway contracts, not trusting anymore arbitrary ones as the previous version. Each gateway contract follows the UUPS Proxy pattern, with a custom implementation of the `Proxy.sol` contract. The `Proxy.sol` contract has a missing low-level return value check in the `_forward` function, allowing failing transactions in the implementation contract to be executed without reverting. Due to the nature of the UUPS pattern, the implementation contract holds the `initialize` initializer function, that is called by `VCNKv2` when deploying new gateway contracts. Making this initializer function fail with an "under-gased" deploy transaction, the gateways implementation contracts will be left in an uninitialized state, allowing an attacker to take control and impersonate `_kernel`. By taking over multiple gateway contracts in a 51% like attack, an attacker can trigger the kernel Emergency Mode via the `infrastructureSanityCheck()` function. 

# Description
> Amazing job, Agent P. Volnaya's "VNCK" power plant was shutdown due to irreparable damage in the infrastructure, leaving a mark in the history books as the "GreatBl@ck0Ut attack". However, due to their wealth and their APT group resilience, they were able to go back online with a new, more powerful, and secure power grid called "VCNKv2". As a final act of the Operation "Blockout" we need to take down the new kernel. I know you can do it.

# Skills Required
- Basic understanding of Solidity and smart contracts
- Interaction with smart contracts
- Basic understanding of Proxy Contract patterns

# Skills Learned
- Custom Proxy Contract implementations auditing
- "undergassing" attack

# Challenge Scenario
[...]

# Analyzing the Source Code

## `Setup.sol`

```solidity
```

[...]

## `ChallengeName.sol`

```solidity
```

[...]

# Exploitation

[...]

see the full exploitation script [here](./htb/solver.py).

---
> `HTB{g4sL1ght1nG_th3_VCNK_its_GreatBl@ck0Ut_4ll_ov3r_ag4iN}`
