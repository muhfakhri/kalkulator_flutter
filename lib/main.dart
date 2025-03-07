
import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false, // Remove debug label
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<String> history = [];

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.add(CalculatorPage(
      onHistoryUpdated: (String calculation) {
        setState(() {
          history.add(calculation); // Tambahkan perhitungan ke riwayat
        });
      },
    ));
    _pages.add(HistoryPage(history: history));
    _pages.add(ProfilePage()); // Tambahkan halaman profil
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator App'),
        backgroundColor: Colors.red[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
              child: Text(
                'Menu Navigasi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.calculate, color: Colors.red[900]),
              title: Text('Kalkulator'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0; // Navigasi ke halaman Kalkulator
                });
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.red[900]),
              title: Text('Riwayat'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1; // Navigasi ke halaman Riwayat
                });
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.red[900]),
              title: Text('Profil'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2; // Navigasi ke halaman Profil
                });
                Navigator.pop(context); // Tutup drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _pages[_selectedIndex], // Tampilkan halaman yang dipilih
      ),
    );
  }
}