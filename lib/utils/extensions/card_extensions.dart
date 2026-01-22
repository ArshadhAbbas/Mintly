import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';

extension CardTypeExtensions on CardTypes {
  Widget get getCardIcon {
    return switch (this) {
      CardTypes.master => SvgPicture.asset(Assets.cards.mastercard.path, height: 20),
      CardTypes.rupay => SvgPicture.asset(Assets.cards.rupay.path, height: 20),
    };
  }
}

extension CurrencyTypeExtensions on CurrencyType {
  String get getCurrency {
    return switch (this) {
      CurrencyType.inr => StringConstants.rupeeIcon,
      CurrencyType.usd => StringConstants.dollarIcon,
    };
  }
}
