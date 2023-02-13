import gleeunit
import gleeunit/should
import bam.{Amount, create_account, deposit, get_balance}

pub fn main() {
  gleeunit.main()
}

pub fn deposit_increases_account_balance_test() {
  create_account()
  |> deposit(Amount(100))
  |> get_balance
  |> should.equal(Amount(100))
}

pub fn negative_deposit_does_not_increase_account_balance_test() {
  create_account()
  |> deposit(Amount(-100))
  |> get_balance
  |> should.equal(Amount(0))
}

pub fn deposits_should_accumulate_test() {
  create_account()
  |> deposit(Amount(100))
  |> deposit(Amount(100))
  |> get_balance
  |> should.equal(Amount(200))
}

pub fn negative_deposits_should_not_accumulate_test() {
  create_account()
  |> deposit(Amount(100))
  |> deposit(Amount(-100))
  |> get_balance
  |> should.equal(Amount(100))
}
