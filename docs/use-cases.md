# Use Cases

## Primary Use Cases

## UC-001 Create Account

### Description

Create a new financial account for an existing user.

### Actor

Internal Service

### Preconditions

- User exists.
- Currency is supported.

### Success

- Account is created.
- Account status is active.
- Initial balance is zero.

### Failure

- User not found.
- Currency is not supported.

---

## UC-002 Transfer Funds

### Description

Transfer funds from one account to another.

### Actor

Payment Service

### Preconditions

- Source account exists.
- Destination account exists.
- Source account is active.
- Destination account is active.
- Source account has enough funds.
- Source and destination accounts are different.

### Success

- Transaction is created.
- Debit ledger entry is created.
- Credit ledger entry is created.
- Audit record is created.
- Transfer is committed atomically.

### Failure

- Account not found.
- Account is frozen or closed.
- Insufficient funds.
- Transaction is rolled back.

---

## UC-003 Get Balance

### Description

Retrieve the current account balance.

### Actor

Client Application

### Preconditions

- Account exists.
- Account is not closed.

### Success

- Current balance is returned.

### Failure

- Account not found.
- Account is closed.

---

## UC-004 Get Transaction History

### Description

Retrieve transaction history for an account.

### Actor

Client Application

### Preconditions

- Account exists.
- Account is not closed.

### Success

- Transaction list is returned.

### Failure

- Account not found.
- Invalid date range.

---

## Supporting Use Cases

## UC-005 Freeze Account

### Description

Temporarily suspend account activity.

### Actor

Internal Service

### Preconditions

- Account exists.
- Account is active.

### Success

- Account status is changed to frozen.
- New incoming and outgoing transfers are blocked.
- Account data remains available.

### Failure

- Account not found.
- Account is already frozen or closed.

---

## UC-006 Close Account

### Description

Close an existing account.

### Actor

Internal Service

### Preconditions

- Account exists.
- Account is active or frozen.
- Account balance is zero.

### Success

- Account status is changed to closed.
- New transactions are blocked.
- Historical data remains available.

### Failure

- Account not found.
- Account balance is not zero.
- Account is already closed.
