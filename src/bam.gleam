import gleam/float
import gleam/io
import gleam/result.{unwrap}
import gleam/option.{Option, Some, None}

/// A bank account.
pub type Account {
  /// This constructor is used for a checking account.
  Checking(balance: Float)
  /// This constructor is used for a savings account.
  Savings(balance: Float)
  /// This constructor is used for a business account.
  Business(balance: Float)
}

/// Get the balance of an account.
///
/// ## Arguments
///
/// - `account`: The account to get the balance of.
///
/// ## Returns
///
/// A string containing the balance of the account.
///
/// ## Examples
///
///     > get_balance(Checking(100.0))
///     "Checking: $100.0"
/// 
///     > get_balance(Savings(100.0))
///     "Savings: $100.0"
///
///     > get_balance(Business(100.0))
///     "Business: $100.0"
pub fn get_balance(account: Account) -> String {
  case account {
    Checking(balance) -> "Checking: $" <> float.to_string(balance)
    Savings(balance) -> "Savings: $" <> float.to_string(balance)
    Business(balance) -> "Business: $" <> float.to_string(balance)
  }
}

/// Deposit money into an account.
///
/// ## Examples
///
///     > deposit(Checking(100.0), 100.0)
///     Checking(200.0)
///
///     > deposit(Savings(100.0), 100.0)
///     Savings(200.0)
pub fn deposit(account: Account, amount: Float) -> Account {
  Checking(account.balance +. amount)
}

/// Withdraw money from an account.
///
/// ## Examples
///
///     > withdraw(Checking(100.0), 50.0)
///     Checking(50.0)
///
///     > withdraw(Savings(100.0), 50.0)
///     Savings(50.0)
pub fn withdraw(account: Account, amount: Float) -> Account {
  Checking(account.balance -. amount)
}

/// Open a new account.
///
/// ## Arguments
///
/// - `initial`: The initial balance of the account.
///
/// ## Returns
///
/// A new account with the given initial balance.
///
/// ## Examples
///
///     > open_account(100.0)
///     Checking(100.0)
///
/// ## Specification
///
/// The following properties should hold for `open_account`.
///
/// > It should have a balance of zero if no initial balance is given.
///
///     > open_account()
///     Checking(0.0)
///
/// > It should have a balance of the given initial balance if it is greater than zero.
///
///     > open_account(100.0)
///     Checking(100.0)
///
/// > It should not be created if the given initial balance is less than zero.
///
///     > open_account(-100.0)
///     Checking(0.0)
///
/// ## TODO: Refine possible errors
///
pub fn open_account(initial_deposit: Option(Float)) -> Result(Account, Nil) {
  case initial_deposit {
    None -> Ok(Checking(0.0))
    Some(amount) if amount >. 0.0 -> Ok(Checking(amount))
    _ -> Error(Nil)
  }
}

pub fn main() {
  // Some(100.0)
  // |> open_account()
  // |> unwrap(Checking(-10.0))
  // |> deposit(100.0)
  // |> deposit(100.0)
  // |> withdraw(50.0)
  // |> get_balance()
  // |> io.println
}
