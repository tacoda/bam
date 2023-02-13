import gleam/io
import gleam/int
import gleam/float

pub type Account {
  Account(balance: Amount)
}

pub type Amount {
  Amount(amount: Int)
}

pub type Currency {
  USD
  GBP
}

pub fn create_account() -> Account {
  Account(Amount(0))
}

pub fn get_balance(account: Account) -> Amount {
  account.balance
}

pub fn deposit(account: Account, amount: Amount) -> Account {
  case amount.amount {
    n if n >= 0 -> Account(Amount(account.balance.amount + amount.amount))
    _n -> account
  }
}

pub fn to_string(balance: Amount) -> String {
  balance.amount
  |> int.to_string
}

pub fn main() {
  create_account()
  |> get_balance
  |> to_string
  |> io.println
}
