import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/model/card_model.dart';

extension CardTypeExtensions on CardTypes {
  Widget get getCardIcon {
    return switch (this) {
      CardTypes.master => SvgPicture.asset(Assets.cards.mastercard.path, height: 30),
      CardTypes.rupay => SvgPicture.asset(Assets.cards.rupay.path),
    };
  }
}

extension CurrencyTypeExtensions on CurrencyType {
  String get getCurrency {
    return switch (this) {
      CurrencyType.inr => "₹",
      CurrencyType.usd => "\$",
    };
  }
}
