import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class QRScreen extends StatelessWidget {
  final int qrData = Random().nextInt(9999);

  QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR Screen'),
        ),
        body: Column(
          children: [
            Center(
                child: Container(
              child: QrImageView(
                data: qrData.toString(),
                version: QrVersions.auto,
                size: 200.0,
              ),
            )),
          ],
        ));
  }
}
