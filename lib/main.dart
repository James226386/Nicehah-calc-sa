import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController _hashrateController = TextEditingController();
  double _profit = 0.0;
  String _selectedCoin = 'BTC';
  String _selectedAlgo = 'SHA256';
  
  final List<String> _coins = ['BTC', 'ETH', 'ZEC', 'DOGE'];
  final Map<String, List<String>> _algos = {
    'BTC': ['SHA256'],
    'ETH': ['Ethash', 'KawPow'],
    'ZEC': ['Equihash'],
    'DOGE': ['Scrypt']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NiceHash SA Calculator'),
        backgroundColor: Color(0xFF1E1E1E),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter Hashrate (MH/s):', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),import 'package:flutter/material.dart';
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
class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController _hashrateController = TextEditingController();
  double _profit = 0.0;
  String _selectedCoin = 'BTC';
  String _selectedAlgo = 'SHA256';
  
  final List<String> _coins = ['BTC', 'ETH', 'ZEC', 'DOGE'];
  final Map<String, List<String>> _algos = {
    'BTC': ['SHA256'],
    'ETH': ['Ethash', 'KawPow'],
    'ZEC': ['Equihash'],
    'DOGE': ['Scrypt']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NiceHash SA Calculator'),
        backgroundColor: Color(0xFF1E1E1E),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter Hashrate (MH/s):', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            TextField(
              controller: _hashrateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Hashrate in MH/s',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedCoin,
              items: _coins.map((String coin) {
                return DropdownMenuItem<String>(
                  value: coin,
                  child: Text(coin),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCoin = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double hashrate = double.tryParse(_hashrateController.text) ?? 0;
                  _profit = hashrate * 0.0005;
                });
              },
              child: Text('Calculate Profit'),
            ),
            SizedBox(height: 16),
            Text('Daily Profit: \$$_profit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
class AdBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: AdWidget(ad: BannerAd(
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(),
      )..load()),
    );
  }
}
