import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proj3/AnaSayfa.dart';
import 'package:proj3/Muzeler.dart';
import 'package:proj3/LoginPage.dart';
import 'Carsilar.dart';
import 'EglenceYerleri.dart';
import 'DogalveManzaraliYerler.dart';
import 'ResimSaglayici.dart';
import 'RotaPlanlayici.dart';
import 'TarihiYerler.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ResimSaglayici(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else {
          bool isLoggedIn = snapshot.data ?? false;
          return MaterialApp(
            title: 'İstanbul Gezi Rehberi',
            initialRoute: isLoggedIn ? '/home' : '/login',
            routes: {
              '/login': (context) => LoginPage(),
              '/home': (context) => AnaSayfa(),
              '/museums': (context) => Muzeler(),
              '/historical': (context) => TarihiYerler(),
              '/nature': (context) => Manzara(),
              '/shopping': (context) => Alisveris(),
              '/themeparks': (context) => Eglence(),
              '/routeplanner': (context) => RotaPlanlayici(),
            },
            home: isLoggedIn ? AnaSayfa() : LoginPage(),
          );
        }
      },
    );
  }
}
