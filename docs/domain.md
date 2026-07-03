# Domain Model

## Overview

Ledger Core models financial accounts, transactions, ledger entries, and audit records.

The ledger is the source of truth for financial state. Account balances may be shown to users, but they must always be reconstructable from ledger entries.

## Core Concepts

### User

Represents an owner of one or more financial accounts.

### Account

Represents a financial account that can hold funds.

An account belongs to one user and has one currency.

An account can be active, frozen, or closed.

### Transaction

Represents a financial operation.

A transaction groups ledger entries into one atomic business operation.

A transaction is either completed fully or rolled back.

### Ledger

Represents the financial record of the system.

The ledger consists of immutable ledger entries.

### Ledger Entry

Represents a single accounting record.

Every transfer creates at least two ledger entries:

- debit entry
- credit entry

Ledger entries cannot be changed or deleted after creation.

### Audit Log

Represents a record of important state-changing actions.

Audit logs are used for traceability and investigation.

## Domain Rules

- Every account belongs to exactly one user.
- Every account has exactly one currency.
- An active account can send and receive funds.
- A frozen account cannot send or receive funds.
- A closed account cannot participate in new transactions.
- A transfer requires a source account and a destination account.
- Source and destination accounts must be different.
- The source account must have enough funds.
- Every transaction must contain at least two ledger entries.
- Ledger entries are append-only.
- Financial records must not be deleted.

## Invariants

- Total debit must equal total credit for every completed transaction.
- Every ledger entry belongs to exactly one transaction.
- Every completed transaction is immutable.
- Account balance can always be reconstructed from ledger entries.
- No partial transfer is allowed.

## Out of Scope

- Credit products
- Card processing
- External payment networks
- Currency exchange
- Fraud detection
