import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Custom Native Ad Widget
class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({Key? key}) : super(key: key);

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? nativeAd;
  bool isAdLoaded = false;
  final String adUnitId = "ca-app-pub-3940256099942544/2247696110";

  // Load the ad
  loadAd() async {
    nativeAd = NativeAd(
      adUnitId: adUnitId,
      factoryId: '', // Default factory ID
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true; // Notify the UI to rebuild when the ad is loaded
          });
          print("Ad Loaded");
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            isAdLoaded =
                false; // Notify the UI to rebuild when the ad fails to load
          });
          print('Ad failed to load: $error');
        },
      ),
      request: const AdRequest(),
      nativeTemplateStyle:
          NativeTemplateStyle(templateType: TemplateType.small),
    );
    nativeAd!.load();
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // MobileAds.instance.initialize(); // Initialize the mobile ads SDK
    loadAd(); // Load the ad after initialization
  }

  @override
  Widget build(BuildContext context) {
    return isAdLoaded
        ? SizedBox(
            height: 400, // Adjust the size as needed
            child: AdWidget(ad: nativeAd!), // Display the ad
          )
        : const Center(
            child: Text(
              'Native Ad Failed to Load!',
              style: TextStyle(fontSize: 18),
            ),
          );
  }
}
