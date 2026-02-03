import 'dart:developer';

import 'package:card_scanner/card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/config/card_number_formatter.dart';
import 'package:mintly/utils/extensions/buildcontext_extensions.dart';
import 'package:mintly/utils/extensions/card_extensions.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/utils/widgets/yellow_button.dart';
import 'package:mintly/view/card_scanner/widgets/add_card_dropdown.dart';
import 'package:mintly/view/card_scanner/widgets/add_card_text_field.dart';

class AddCardView extends ConsumerStatefulWidget {
  static const String path = "/add_card";
  static const String pathName = "add_card";
  static const String cardIdQuery = "card_id";
  const AddCardView({super.key, this.cardId});
  final int? cardId;

  @override
  ConsumerState<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends ConsumerState<AddCardView> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.cardId != null) {
        CardModel card = ref.watch(cardsControllerProvider).firstWhere((element) => element.cardId == widget.cardId);
        cardNumberController.text = card.cardNumber;
        cardHolderNameController.text = card.cardHolderName ?? "";
        expirationDateController.text = card.expiry;
        balanceController.text = card.balance.toString();
        cardTypeController.text = card.cardType ?? "";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Add Card", style: TextStyleConstants.w600F20),
              SizedBox(height: 20),
              Text(
                "Enter your card details manually or scan your card to auto-fill",
                style: TextStyleConstants.w400F14.copyWith(color: Colors.black.withValues(alpha: 0.3)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              YellowButton(
                onTap: () async {
                  CardDetails? cardDetails = await CardScanner.scanCard(
                    scanOptions: CardScanOptions(
                      scanCardHolderName: true,
                      validCardsToScanBeforeFinishingScan: 5,
                      possibleCardHolderNamePositions: [CardHolderNameScanPosition.belowCardNumber],
                    ),
                  );
                  if (cardDetails != null) {
                    cardHolderNameController.text = cardDetails.cardHolderName;
                    cardNumberController.text = cardDetails.cardNumber.splitStringByLength(splitLength: 4);
                    expirationDateController.text = cardDetails.expiryDate;
                    cardTypeController.text = CardIssuer.values
                        .firstWhere(
                          (element) =>
                              element.name.replaceAll(" ", "_").toLowerCase() ==
                              cardDetails.cardIssuer.replaceAll(" ", "_").replaceAll("CardIssuer.", "").toLowerCase(),
                          orElse: () => CardIssuer.unknown,
                        )
                        .name
                        .toTitleCase;
                  }
                },
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HugeIcon(icon: HugeIcons.strokeRoundedCameraAdd01, strokeWidth: 2),
                    Text("Scan Card", style: TextStyleConstants.w500F16),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                spacing: 6,
                children: [
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Card Number", style: TextStyleConstants.w400F14),
                  SizedBox(height: 6),
                  AddCardTextField(
                    textEdingController: cardNumberController,
                    hintText: "************".splitStringByLength(splitLength: 4),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(16), CardNumberFormatter()],
                    textInputType: TextInputType.numberWithOptions(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 15),
                  Text("Cardholder Name", style: TextStyleConstants.w400F14),
                  SizedBox(height: 6),
                  AddCardTextField(textEdingController: cardHolderNameController, hintText: "Name", textInputAction: TextInputAction.next),
                  SizedBox(height: 15),
                  Text("Expiry Date", style: TextStyleConstants.w400F14),
                  SizedBox(height: 6),
                  AddCardTextField(
                    textEdingController: expirationDateController,
                    hintText: "MM/YY",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    maxLength: 5,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardExpirationFormatter(separator: "/"),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Card Type", style: TextStyleConstants.w400F14),
                            SizedBox(height: 6),
                            AddCardDropDown(
                              dropdownMenuEntries: CardIssuer.values.map((e) => DropdownMenuEntry(value: e, label: e.titleCase)).toList(),
                              controller: cardTypeController,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Current Balance", style: TextStyleConstants.w400F14),
                            SizedBox(height: 6),
                            AddCardTextField(
                              textEdingController: balanceController,
                              hintText: StringConstants.rupeeIcon,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlackButton(
        onTap: () {
          final fields = [balanceController.text, expirationDateController.text, cardNumberController.text, cardHolderNameController.text];

          if (fields.any((e) => e.trim().isEmpty)) {
            context.showSnackBar("Please fill all the mandatory fields");
            return;
          }

          try {
            final cards = ref.read(cardsControllerProvider);

            ref
                .read(cardsControllerProvider.notifier)
                .addNewCard(
                  CardModel(
                    cardId: widget.cardId != null
                        ? widget.cardId!
                        : cards.isEmpty
                        ? 0
                        : cards.last.cardId + 1,
                    cardType: cardTypeController.text.isEmpty ? null : cardTypeController.text.trim(),
                    balance: num.parse(balanceController.text.trim()),
                    expiry: expirationDateController.text.trim(),
                    cardNumber: cardNumberController.text.replaceAll(" ", "").trim(),
                    cardHolderName: cardHolderNameController.text,
                  ),
                );

            context.pop();
          } catch (e, s) {
            log(e.toString(), stackTrace: s);
          }
        },
        text: "Save Card",
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      ),
    );
  }
}
