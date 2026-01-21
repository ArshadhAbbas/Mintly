import 'package:flutter/material.dart';
import 'package:mintly/utils/extensions/card_extensions.dart';

enum CardTypes { master, rupay }

enum CurrencyType { inr, usd }

class CardModel {
  final CardTypes cardType;
  final CurrencyType currency;
  final String cardNumber;
  final num balance;
  final String expiry;
  final Widget cardIcon;

  CardModel({required this.cardType, required this.currency, required this.balance, required this.expiry, required this.cardNumber})
    : cardIcon = cardType.getCardIcon;
}
