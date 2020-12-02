# Bank Tech Test in Ruby

## About
A bank program which allows the user to instantiate a bank account, deposit and withdraw money and print a statement. Written for Makers week 10 tech test.

## Instructions

### Getting started

1. Clone the repository:

```
$ git clone https://github.com/emilyalice2708/bank-test-ruby
```

2. Run in irb:
```
$ irb
$ require './lib.bank_account.rb'
```
### Usage

Instantiating a new account:
```
account = BankAccount.new
```

Deposits:
```
account.deposit(amount)
```

Withdrawals:
```
account.withdraw(amount)
```

Print statement:
```
account.print_statement
```

### Tests

Run rspec from the root directory:
```
$ rspec
```

Specification and planning in [planning.md](https://github.com/emilyalice2708/bank-test-ruby/blob/main/planning.md)
