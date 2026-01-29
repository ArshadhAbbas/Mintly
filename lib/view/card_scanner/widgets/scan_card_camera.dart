import 'package:card_scanner/card_scanner.dart';
import 'package:flutter/material.dart';

class ScanCardCamera extends StatefulWidget {
  const ScanCardCamera({super.key});

  @override
  _ScanCardCameraState createState() => _ScanCardCameraState();
}

class _ScanCardCameraState extends State<ScanCardCamera> {
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = CardScanOptions(
    scanCardHolderName: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

  Future<void> scanCard() async {
    var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted) return;
    setState(() {
      _cardDetails = cardDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('card_scanner app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  scanCard();
                },
                child: Text('scan card'),
              ),
              Text('$_cardDetails'),
              
            ],
          ),
        ),
      ),
    );
  }
}