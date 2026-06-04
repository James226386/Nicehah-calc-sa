import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(NiceHashApp());
}

class NiceHashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NiceHash Calculator SA',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF00C853),
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      home: CalculatorPage(),
    );
  }
}
