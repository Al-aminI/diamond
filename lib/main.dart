import 'package:diamond/components/banner.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance
    ..initialize()
    ..updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: ["DB21FB2E116282C610E58F98BF96340A"]),
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
