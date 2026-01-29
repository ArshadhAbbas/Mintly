import 'package:card_scanner/card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mintly/gen/assets.gen.dart';

extension CardTypeExtensions on CardIssuer {
  Widget get getCardIcon {
    return switch (this) {
      CardIssuer.visa => getPicture(Assets.cards.visaLogo.path),
      CardIssuer.mastercard => getPicture(Assets.cards.mastercard.path),
      CardIssuer.dinersClub => getPicture(Assets.cards.dinersClubLogo.path),
      CardIssuer.amex => getPicture(Assets.cards.amex.path),
      CardIssuer.jcb => getPicture(Assets.cards.jcb.path),
      CardIssuer.bCGlobal => getPicture(Assets.cards.bcGlobal.path),
      CardIssuer.carteBlanche => getPicture(Assets.cards.carteBlanche.path),
      CardIssuer.instaPayment => getPicture(Assets.cards.instaPayLogo.path),
      CardIssuer.solo => getPicture(Assets.cards.soloPay.path),
      CardIssuer.unionPay => getPicture(Assets.cards.unionPayLogo.path),
      CardIssuer.koreanLocal => getPicture(Assets.cards.bankOfKorea.path),
      CardIssuer.discover => getPicture(Assets.cards.discoverLogo.path),
      CardIssuer.maestro => getPicture(Assets.cards.maestroLogo.path),
      _ => SizedBox.shrink(),
    };
  }

  SvgPicture getPicture(String path) => SvgPicture.asset(path, height: 20);

  String get titleCase {
    final raw = name;
    final spaced = raw.replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (match) => '${match.group(1)} ${match.group(2)}');
    return spaced.split(' ').map((word) => word.isEmpty ? word : word[0].toUpperCase() + word.substring(1)).join(' ');
  }
}
