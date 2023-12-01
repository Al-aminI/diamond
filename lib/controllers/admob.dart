import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobController with ChangeNotifier {
  AdmobController._();

  static AdmobController instance = AdmobController._();

  bool loaded = false;
  late BannerAd bannerAd;

  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    throw UnsupportedError('Unsupported platform');
  }

  String getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    throw UnsupportedError('Unsupported platform');
  }

  String getRewardBasedVideoAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    }
    throw UnsupportedError('Unsupported platform');
  }

  void loadBanner() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: getBannerAdUnitId(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          loaded = true;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Error: ${error.message}');
        },
      ),
      request: const AdRequest(),
    )..load();
  }
}
