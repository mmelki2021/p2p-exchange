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
    final isMobile = MediaQuery.of(context).size.width < 700;

    if (isMobile) {
      return Scaffold(
        appBar: AppBar(
          title: Text('P2P Exchange'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Image.asset(
                  'assets/images/p2p_exchange_logo.png',
                  height: 160,
                ),
                SizedBox(height: 16),
                Text(
                  'P2P Exchange Platform',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E88E5),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Exchange currencies safely and instantly between peers.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 32),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email address',
                    prefixIcon: Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => DashboardScreen()),
                      );
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupScreenWeb()),
                    );
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(color: Color(0xFF8E24AA)),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E88E5), Color(0xFF8E24AA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 960),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: SizedBox(
                  height: 520,
                  child: Row(
                    children: [
                      // Left marketing / branding panel
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
                            color: Color(0xFF0D47A1),
                          ),
                          padding: EdgeInsets.all(32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/p2p_exchange_logo.png',
                                height: 120,
                              ),
                              SizedBox(height: 24),
                              Text(
                                'Peer‑to‑Peer\nCurrency Exchange',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Create offers, match with other users\nand settle exchanges securely in minutes.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Icon(Icons.lock_outline, color: Colors.white70, size: 18),
                                  SizedBox(width: 8),
                                  Text(
                                    'Escrow‑like protection for your trades',
                                    style: TextStyle(color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.flash_on, color: Colors.white70, size: 18),
                                  SizedBox(width: 8),
                                  Text(
                                    'Instant matching with best rates',
                                    style: TextStyle(color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right form panel
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Sign in to manage your wallet, offers and exchanges.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 32),
                              TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email address',
                                  prefixIcon: Icon(Icons.email_outlined),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock_outline),
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot your password?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF1E88E5),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (_) => DashboardScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF1E88E5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'New to P2P Exchange?',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (_) => SignupScreenWeb()),
                                      );
                                    },
                                    child: Text(
                                      'Create an account',
                                      style: TextStyle(color: Color(0xFF8E24AA)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
    final isMobile = MediaQuery.of(context).size.width < 900;

    if (isMobile) {
      // Mobile-friendly layout: single column, similar to the initial implementation
      return Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView(
            children: [
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
                      Text(
                        '\$${walletBalance.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 120,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, walletBalance * 0.7 / 1000),
                                  FlSpot(1, walletBalance * 0.75 / 1000),
                                  FlSpot(2, walletBalance * 0.8 / 1000),
                                  FlSpot(3, walletBalance * 0.9 / 1000),
                                  FlSpot(4, walletBalance / 1000),
                                ],
                                isCurved: true,
                                barWidth: 3,
                                dotData: FlDotData(show: false),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Marketplace Offers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5)),
              ),
              SizedBox(height: 10),
              Column(
                children: offers
                    .map(
                      (offer) => Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 4,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF8E24AA),
                            child: Text(offer['from']!, style: TextStyle(color: Colors.white)),
                          ),
                          title: Text('${offer['from']} → ${offer['to']}'),
                          subtitle: Text('Rate: ${offer['rate']} | User: ${offer['user']}'),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF1E88E5)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => OfferDetailScreen(offer: offer)),
                            );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5)),
              ),
              SizedBox(height: 10),
              Column(
                children: transactions
                    .map(
                      (t) => Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: Icon(
                            t['status'] == 'Completed' ? Icons.check_circle : Icons.timelapse,
                            color: t['status'] == 'Completed' ? Color(0xFF16A34A) : Color(0xFFF97316),
                          ),
                          title: Text('${t['from']} → ${t['to']} : ${t['amount']}'),
                          subtitle: Text('Status: ${t['status']}'),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => NewOfferScreen()),
            );
          },
        ),
      );
    }

    // Web layout: keep the modern dashboard with sidebar and cards
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.currency_exchange, size: 22),
            SizedBox(width: 8),
            Text('P2P Exchange Dashboard'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        color: Color(0xFFF1F5F9),
        child: Row(
          children: [
            // Sidebar navigation
            Container(
              width: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
                    child: Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  _SidebarItem(
                    icon: Icons.dashboard_outlined,
                    label: 'Dashboard',
                    selected: true,
                  ),
                  _SidebarItem(
                    icon: Icons.swap_horiz,
                    label: 'My Offers',
                  ),
                  _SidebarItem(
                    icon: Icons.history,
                    label: 'Transactions',
                  ),
                  _SidebarItem(
                    icon: Icons.account_balance_wallet_outlined,
                    label: 'Wallet',
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0F2FE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tips',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF1D4ED8),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Create a featured offer to be highlighted to more users.',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF1E40AF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main content
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good afternoon, Trader',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Here is a snapshot of your balances, offers and recent exchanges.',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 24),
                      // Top cards: wallet + small stats
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Card(
                              color: Color(0xFF1E88E5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              elevation: 4,
                              child: Padding(
                                padding: EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Wallet balance',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.white24,
                                            borderRadius: BorderRadius.circular(999),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.trending_up, size: 16, color: Colors.white),
                                              SizedBox(width: 4),
                                              Text(
                                                '+4.8%',
                                                style: TextStyle(color: Colors.white, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      '\$${walletBalance.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Across all currencies',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    SizedBox(
                                      height: 120,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(show: false),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(0, walletBalance * 0.7 / 1000),
                                                FlSpot(1, walletBalance * 0.75 / 1000),
                                                FlSpot(2, walletBalance * 0.8 / 1000),
                                                FlSpot(3, walletBalance * 0.9 / 1000),
                                                FlSpot(4, walletBalance / 1000),
                                              ],
                                              isCurved: true,
                                              barWidth: 3,
                                              dotData: FlDotData(show: false),
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                _StatCard(
                                  title: 'Active offers',
                                  value: offers.length.toString(),
                                  icon: Icons.swap_horiz,
                                  color: Color(0xFF22C55E),
                                ),
                                SizedBox(height: 12),
                                _StatCard(
                                  title: 'Completed trades',
                                  value: transactions
                                      .where((t) => t['status'] == 'Completed')
                                      .length
                                      .toString(),
                                  icon: Icons.check_circle_outline,
                                  color: Color(0xFF6366F1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      // Bottom section: offers & transactions tables
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Marketplace offers',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (_) => NewOfferScreen()),
                                            );
                                          },
                                          icon: Icon(Icons.add),
                                          label: Text('New offer'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    DataTable(
                                      headingTextStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF475569),
                                      ),
                                      columns: const [
                                        DataColumn(label: Text('From')),
                                        DataColumn(label: Text('To')),
                                        DataColumn(label: Text('Rate')),
                                        DataColumn(label: Text('User')),
                                        DataColumn(label: Text('')),
                                      ],
                                      rows: offers
                                          .map(
                                            (offer) => DataRow(
                                              cells: [
                                                DataCell(Text(offer['from']!)),
                                                DataCell(Text(offer['to']!)),
                                                DataCell(Text(offer['rate']!)),
                                                DataCell(Text(offer['user']!)),
                                                DataCell(
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (_) => OfferDetailScreen(offer: offer),
                                                        ),
                                                      );
                                                    },
                                                    child: Text('View'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Recent transactions',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Column(
                                      children: transactions
                                          .map(
                                            (t) => ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              leading: CircleAvatar(
                                                radius: 18,
                                                backgroundColor: Color(0xFFE5E7EB),
                                                child: Icon(
                                                  t['status'] == 'Completed'
                                                      ? Icons.check_circle
                                                      : Icons.timelapse,
                                                  color: t['status'] == 'Completed'
                                                      ? Color(0xFF16A34A)
                                                      : Color(0xFFF97316),
                                                  size: 18,
                                                ),
                                              ),
                                              title: Text(
                                                '${t['from']} → ${t['to']}',
                                                style: TextStyle(fontWeight: FontWeight.w500),
                                              ),
                                              subtitle: Text(
                                                'Amount: ${t['amount']}',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              trailing: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: t['status'] == 'Completed'
                                                      ? Color(0xDCF0FDF4)
                                                      : Color(0xFFFFFBEB),
                                                  borderRadius: BorderRadius.circular(999),
                                                ),
                                                child: Text(
                                                  t['status'],
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: t['status'] == 'Completed'
                                                        ? Color(0xFF166534)
                                                        : Color(0xFF92400E),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _SidebarItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: selected ? Color(0xFFF1F5F9) : Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: selected ? Color(0xFF1E88E5) : Color(0xFF64748B),
            ),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: selected ? Color(0xFF1E293B) : Color(0xFF64748B),
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 20),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ],
        ),
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
