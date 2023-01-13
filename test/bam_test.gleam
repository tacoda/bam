import gleam/result.{unwrap, unwrap_error}
import gleam/option.{Some, None}
import gleeunit
import gleeunit/should
import bam


pub fn main() {
  gleeunit.main()
}

pub fn open_account_without_initial_deposit_should_succeed_test() {
  None
    |> bam.open_account
    |> should.be_ok
}

pub fn open_account_without_initial_deposit_default_balance_test() {
  let account = None
    |> bam.open_account
    |> unwrap(bam.Checking(999.9))

  account.balance
    |> should.equal(0.0)
}

pub fn open_account_with_initial_deposit_should_succeed_test() {
  Some(100.0)
    |> bam.open_account
    |> should.be_ok
}

pub fn open_account_with_initial_deposit_has_correct_balance_test() {
  let account = Some(100.0)
    |> bam.open_account
    |> unwrap(bam.Checking(0.0))

  account.balance
    |> should.equal(100.0)
}

pub fn open_account_with_negative_initial_deposit_should_error_test() {
  Some(-100.0)
    |> bam.open_account
    |> should.be_error
}

// pub fn open_account_with_negative_initial_deposit_error_message_has_correct_message_test() {
//   Some(-100.0)
//     |> bam.open_account
//     |> unwrap_error("")
//     |> should.equal("Initial deposit must be positive.")
// }

pub fn depositing_funds_in_account_should_succeed_test() {
  let account = None
    |> bam.open_account
    |> unwrap(bam.Checking(999.9))

  // account
  //   |> bam.deposit(100.0)
  //   |> should.be_ok
}