import 'package:diamond/components/admob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance
    ..initialize()
    ..updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: ["7A091B1D32EBC165A7498F42BBA86391"]),
    );
  runApp(
    MaterialApp(
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: AdmobComponent(),
          ),
        ),
      ),
      theme: ThemeData.light(),
    ),
  );
}
