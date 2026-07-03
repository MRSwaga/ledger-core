# Architecture

## Overview

Ledger Core is a modular monolith backend application.

The system is deployed as one Spring Boot service, but the codebase is divided into clear internal modules.

This keeps the project realistic for one developer while still demonstrating production-style backend design.

## Architecture Style

- Modular monolith
- Layered architecture
- REST API
- Relational database

## Technology Stack

- Java 21
- Spring Boot
- Maven
- PostgreSQL
- Spring Data JPA
- Flyway
- Spring Validation
- Spring Security
- JUnit
- Mockito
- Docker

## Modules

### Account Module

Responsible for:

- account creation
- account status changes
- balance retrieval

### Transaction Module

Responsible for:

- transfer validation
- transaction creation
- transfer coordination

### Ledger Module

Responsible for:

- debit entries
- credit entries
- balance reconstruction

### Audit Module

Responsible for:

- recording important state changes
- storing operation history

## Layers

```text
Controller
↓
Service
↓
Repository
↓
Database
```

### Controller Layer

Handles HTTP requests and responses.

Controllers must not contain business logic.

### Service Layer

Contains business logic and coordinates use cases.

### Repository Layer

Handles database access.

Repositories must not contain business rules.

### Database Layer

Stores accounts, transactions, ledger entries, and audit records.

## Core Rules

- Ledger entries are the source of truth.
- Financial operations must be atomic.
- Business rules belong in the service layer.
- Database schema changes are managed by Flyway.
- The MVP must stay simple and maintainable.

## Transaction Handling

A transfer must complete all required steps or rollback everything.

Required steps:

- validate accounts
- validate balance
- create transaction
- create debit entry
- create credit entry
- create audit record

Partial transfers are not allowed.

## MVP Scope

- Account management
- Fund transfer
- Balance retrieval
- Transaction history
- Audit logging

## Out of Scope

- Microservices
- Kafka
- Kubernetes
- External payment providers
- Card processing
- Currency exchange
- Fraud detection
