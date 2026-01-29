class CardModel {
  final int cardId;
  final String? cardType;
  final String cardNumber;
  final num balance;
  final String expiry;

  CardModel({required this.cardId, required this.cardType, required this.balance, required this.expiry, required this.cardNumber});
}
