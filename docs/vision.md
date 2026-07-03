# Vision

## Overview

Ledger Core is a Java backend application for managing financial accounts and recording financial operations.

The project is designed as a portfolio-grade fintech backend system. Its goal is to demonstrate solid backend engineering skills with a realistic but limited scope.

## Purpose

Ledger Core provides a reliable ledger for account operations.

The system focuses on:

- financial consistency
- atomic transactions
- clear domain boundaries
- auditability
- maintainable backend architecture

## Target Users

Ledger Core can be used by internal fintech systems, payment platforms, or banking backends that need to track account operations reliably.

## Core Features

- Account creation
- Account freezing
- Account closing
- Balance retrieval
- Fund transfer
- Transaction history
- Audit logging

## Core Principles

- Correctness is more important than availability.
- A transfer must be completed fully or not completed at all.
- Ledger entries are immutable.
- Financial data must be auditable.
- The system must stay simple enough to be built and maintained by one developer.

## MVP Scope

The MVP is limited to account management and internal fund transfers.

## Out of Scope

- External payment providers
- Card processing
- Currency exchange
- Loans
- Fraud detection
- Microservices
- Kafka
- Kubernetes
