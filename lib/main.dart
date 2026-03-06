import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(P2PApp());

class P2PApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P2P Exchange',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1E88E5),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF8E24AA)),
        scaffoldBackgroundColor: Color(0xFFF2F6FA),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1E88E5),
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF1E88E5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8E24AA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

// ---------------- SPLASH ----------------
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreenWeb()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/p2p_exchange_logo.png',
              height: 320,
            ),
            SizedBox(height: 16),
            Text(
              'P2P Exchange',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E88E5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- LOGIN WEB ----------------
class LoginScreenWeb extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/p2p_exchange_logo.png',
                  height: 320,
                ),
                SizedBox(height: 16),
                Text(
                  'P2P Exchange Platform',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5)),
                ),
                SizedBox(height: 8),
                Text(
                  'Exchange currencies safely and instantly between peers.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Color(0xFF1E88E5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreenWeb()));
                  },
                  child: Text('Create an account', style: TextStyle(color: Color(0xFF8E24AA))),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(12),
                  color: Color(0xFFE3F2FD),
                  child: Column(
                    children: [
                      Text('🚀 Promote your exchange offer here!', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF1E88E5), fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Get featured to reach more users.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- SIGNUP WEB ----------------
class SignupScreenWeb extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/p2p_exchange_logo.png',
                  height: 320,
                ),
                SizedBox(height: 16),
                Text('Create Account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5))),
                SizedBox(height: 8),
                TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name', filled: true, fillColor: Colors.grey[100], border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                SizedBox(height: 16),
                TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email', filled: true, fillColor: Colors.grey[100], border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                SizedBox(height: 16),
                TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password', filled: true, fillColor: Colors.grey[100], border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashboardScreen()));
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Color(0xFF1E88E5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: Text('Signup', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- DASHBOARD ----------------
class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {'from': 'USD', 'to': 'EUR', 'rate': '0.92', 'user': 'Alice'},
    {'from': 'EUR', 'to': 'TND', 'rate': '3.4', 'user': 'Bob'},
    {'from': 'USD', 'to': 'TND', 'rate': '3.25', 'user': 'Charlie'},
  ];

  final List<Map<String, dynamic>> transactions = [
    {'from': 'USD', 'to': 'EUR', 'amount': 100, 'status': 'Completed'},
    {'from': 'EUR', 'to': 'TND', 'amount': 50, 'status': 'Pending'},
  ];

  final double walletBalance = 1250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            // Wallet + Chart
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Color(0xFF1E88E5),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Wallet Balance', style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(height: 10),
                    Text('\$${walletBalance.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    SizedBox(height: 120, child: LineChart(LineChartData(gridData: FlGridData(show: false), titlesData: FlTitlesData(show: false), borderData: FlBorderData(show: false), lineBarsData: [LineChartBarData(spots: [FlSpot(0, walletBalance*0.7/1000), FlSpot(1, walletBalance*0.75/1000), FlSpot(2, walletBalance*0.8/1000), FlSpot(3, walletBalance*0.9/1000), FlSpot(4, walletBalance/1000)], isCurved: true, barWidth: 3, dotData: FlDotData(show: false), color: Colors.white)]))),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Offers
            Text('Marketplace Offers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5))),
            SizedBox(height: 10),
            Column(children: offers.map((offer) => Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Color(0xFF8E24AA), child: Text(offer['from']!, style: TextStyle(color: Colors.white))),
                title: Text('${offer['from']} → ${offer['to']}'),
                subtitle: Text('Rate: ${offer['rate']} | User: ${offer['user']}'),
                trailing: ElevatedButton(child: Text('Buy'), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => OfferDetailScreen(offer: offer))); }),
              ),
            )).toList()),
            SizedBox(height: 20),
            // Transactions
            Text('Recent Transactions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5))),
            SizedBox(height: 10),
            Column(children: transactions.map((t) => Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(title: Text('${t['from']} → ${t['to']} : ${t['amount']}'), subtitle: Text('Status: ${t['status']}')),
            )).toList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => NewOfferScreen())); },
      ),
    );
  }
}

// ---------------- OFFER DETAIL ----------------
class OfferDetailScreen extends StatelessWidget {
  final Map<String, String> offer;
  OfferDetailScreen({required this.offer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offer Detail')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('From: ${offer['from']}', style: TextStyle(fontSize: 18)),
          Text('To: ${offer['to']}', style: TextStyle(fontSize: 18)),
          Text('Rate: ${offer['rate']}', style: TextStyle(fontSize: 18)),
          Text('User: ${offer['user']}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), child: Text('Confirm Exchange')),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => QrCashScreen())); },
            ),
          ),
        ]),
      ),
    );
  }
}

// ---------------- NEW OFFER ----------------
class NewOfferScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create New Offer')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(controller: fromController, decoration: InputDecoration(labelText: 'From Currency')),
            TextFormField(controller: toController, decoration: InputDecoration(labelText: 'To Currency')),
            TextFormField(controller: rateController, decoration: InputDecoration(labelText: 'Rate'), keyboardType: TextInputType.numberWithOptions(decimal: true)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Add Offer'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Offer Added!')));
                  Navigator.pop(context);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}

// ---------------- QR CASH ----------------
class QrCashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Cash Pickup')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.qr_code, size: 150, color: Color(0xFF1E88E5)),
          SizedBox(height: 20),
          Text('Show this QR code to receive cash', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
        ]),
      ),
    );
  }
}
