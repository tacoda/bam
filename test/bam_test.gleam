import gleam/result.{unwrap, unwrap_error}
import gleam/option.{None, Some}
import gleeunit
import gleeunit/should
import bam

pub fn main() {
  gleeunit.main()
}

pub fn open_account_without_initial_deposit_default_balance_test() {
  let account = bam.open_account(0.0)

  account.balance
  |> should.equal(0.0)
}

pub fn open_account_with_initial_deposit_has_correct_balance_test() {
  let account = bam.open_account(100.0)

  account.balance
  |> should.equal(100.0)
}

pub fn open_account_with_negative_initial_deposit_should_have_default_balance_test() {
  let account = bam.open_account(-100.0)

  account.balance
  |> should.equal(0.0)
}

pub fn depositing_funds_in_account_should_increase_funds_test() {
  let account =
    bam.open_account(0.0)
    |> bam.deposit(100.0)

  account.balance
  |> should.equal(100.0)
}
