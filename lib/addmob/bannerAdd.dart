import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerADD extends StatefulWidget {
  @override
  _BannerADD createState() => _BannerADD();
}

class _BannerADD extends State<BannerADD> {
  late BannerAd _bannerAd;
  bool _isBannerAdLoaded = false;
  bool _isBannerAdFailed = false;

  @override
  void initState() {
    super.initState();

    // Create the Banner Ad
    _bannerAd = BannerAd(
      adUnitId:
          'ca-app-pub-3940256099942544/6300978111', // Use this for testing
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _isBannerAdLoaded = true;
            _isBannerAdFailed = false; // Reset the failed flag on success
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          setState(() {
            _isBannerAdLoaded = false;
            _isBannerAdFailed = true;
          });
          print('Banner Ad failed to load: $error');
        },
      ),
    );

    // Load the Banner Ad
    _bannerAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_isBannerAdLoaded && !_isBannerAdFailed)
          Center(child: CircularProgressIndicator()),

        // Show the Banner Ad if it has been loaded successfully
        if (_isBannerAdLoaded)
          Container(
            alignment: Alignment.center,
            width: _bannerAd.size.width.toDouble(),
            height: _bannerAd.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd),
          ),

        // Show an error message if the ad failed to load
        if (_isBannerAdFailed)
          Center(
              child: Text("Failed to load banner ad.",
                  style: TextStyle(color: Colors.red))),
      ],
    );
    // Show loading indicator only while the ad is loading
  }
}
