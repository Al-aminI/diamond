import 'package:diamond/controllers/admob.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobComponent extends StatelessWidget {
  const AdmobComponent({super.key});

  @override
  Widget build(BuildContext context) {
    AdmobController.instance.loadBanner();
    return ListenableBuilder(
      listenable: AdmobController.instance,
      builder: (context, child) {
        if (AdmobController.instance.loaded) {
          return SizedBox(
            height: AdmobController.instance.bannerAd.size.height.toDouble(),
            width: AdmobController.instance.bannerAd.size.width.toDouble(),
            child: AdWidget(
              ad: AdmobController.instance.bannerAd,
            ),
          );
        }
        return const Center(
          child: Text(
            'Loading...',
          ),
        );
      },
    );
  }
}
