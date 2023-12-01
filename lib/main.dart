import 'package:diamond/components/admob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance
    ..initialize()
    ..updateRequestConfiguration(
      RequestConfiguration(
          testDeviceIds: ['7B3EEABB8EE11C2BE770B684D95219ECB']),
    );
  runApp(
    MaterialApp(
      home: const Center(
        child: AdmobComponent(),
      ),
      theme: ThemeData.light(),
    ),
  );
}
