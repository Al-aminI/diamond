import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobController with ChangeNotifier {
  AdmobController._();

  static AdmobController instance = AdmobController._();

  bool loaded = false;
  late BannerAd bannerAd;

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  void loadBanner() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          loaded = true;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          print('Error: ${error.message}');
        },
      ),
      request: const AdRequest(),
    )..load();
  }
}
