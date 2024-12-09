import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:test_banner_add/addmob/bannerAdd.dart';
import 'package:test_banner_add/addmob/native_add_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  // MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
  //     testDeviceIds: ["23786B1A4D4A966DB6E5C01784C5A063"]));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BannerAdExample(),
    );
  }
}

class BannerAdExample extends StatefulWidget {
  @override
  _BannerAdExampleState createState() => _BannerAdExampleState();
}

class _BannerAdExampleState extends State<BannerAdExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Banner Ad Example'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Top Beautiful Container
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                'Beautiful Container at the Top',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          NativeAdWidget(),
          // SizedBox(
          //   height: 50,
          // ),
          BannerADD()
        ],
      ),
    );
  }
}
