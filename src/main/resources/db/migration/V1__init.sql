create table users (
    id uuid primary key,
    email varchar(255) not null unique,
    created_at timestamp not null
);

create table accounts (
    id uuid primary key,
    user_id uuid not null references users(id) on delete restrict,
    currency varchar(3) not null,
    status varchar(32) not null,
    created_at timestamp not null,
    updated_at timestamp not null,

    constraint chk_accounts_currency check (currency in ('USD', 'EUR', 'GBP')),
    constraint chk_accounts_status check (status in ('ACTIVE', 'FROZEN', 'CLOSED'))
);

create table transactions (
    id uuid primary key,
    source_account_id uuid not null references accounts(id) on delete restrict,
    destination_account_id uuid not null references accounts(id) on delete restrict,
    amount numeric(19, 2) not null,
    currency varchar(3) not null,
    status varchar(32) not null,
    created_at timestamp not null,

    constraint chk_transactions_amount check (amount > 0),
    constraint chk_transactions_currency check (currency in ('USD', 'EUR', 'GBP')),
    constraint chk_transactions_status check (status in ('PENDING', 'COMPLETED', 'FAILED')),
    constraint chk_transactions_accounts_different check (source_account_id <> destination_account_id)
);

create table ledger_entries (
    id uuid primary key,
    transaction_id uuid not null references transactions(id) on delete restrict,
    account_id uuid not null references accounts(id) on delete restrict,
    entry_type varchar(16) not null,
    amount numeric(19, 2) not null,
    currency varchar(3) not null,
    created_at timestamp not null,

    constraint chk_ledger_entries_type check (entry_type in ('DEBIT', 'CREDIT')),
    constraint chk_ledger_entries_amount check (amount > 0),
    constraint chk_ledger_entries_currency check (currency in ('USD', 'EUR', 'GBP'))
);

create table audit_logs (
    id uuid primary key,
    action varchar(128) not null,
    entity_type varchar(64) not null,
    entity_id uuid not null,
    created_at timestamp not null
);

create index idx_accounts_user_id on accounts(user_id);
create index idx_transactions_source_account_id on transactions(source_account_id);
create index idx_transactions_destination_account_id on transactions(destination_account_id);
create index idx_ledger_entries_transaction_id on ledger_entries(transaction_id);
create index idx_ledger_entries_account_id on ledger_entries(account_id);