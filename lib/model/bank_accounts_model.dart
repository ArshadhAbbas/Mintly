class BankAccountsModel {
  final int id;
  final String accountNumber;
  final String ifscCode;
  final String bankName;
  final num accountBalance;

  BankAccountsModel({
    required this.id,
    required this.accountNumber,
    required this.ifscCode,
    required this.accountBalance,
    required this.bankName,
  });
}
