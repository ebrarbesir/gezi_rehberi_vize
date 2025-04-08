import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ResimSaglayici.dart';

class Secenekler extends StatelessWidget {
  const Secenekler({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final resimSaglayici = Provider.of<ResimSaglayici>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal[50]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  resimSaglayici.yukleniyor
                      ? CircularProgressIndicator()
                      : SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        resimSaglayici.imageURL ?? 'https://picsum.photos/200',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "exploreApp",
                          style: TextStyle(
                            color: Colors.white24,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "İstanbul",
                        style: GoogleFonts.poppins(
                          color: Colors.red[300],
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              offset: Offset(1.5, 1.5),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Ana Sayfa"),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          Divider(color: Colors.blueGrey, thickness: 1, height: 20),
          ExpansionTile(
            leading: Icon(Icons.explore),
            title: Text("Gezilecek Yerler"),
            children: [
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text("Tarihi Yerler"),
                onTap: () {
                  Navigator.pushNamed(context, '/historical');
                },
              ),
              ListTile(
                leading: Icon(Icons.museum),
                title: Text("Müzeler"),
                onTap: () {
                  Navigator.pushNamed(context, '/museums');
                },
              ),
              ListTile(
                leading: Icon(Icons.park),
                title: Text("Doğal ve Manzaralı Yerler"),
                onTap: () {
                  Navigator.pushNamed(context, '/nature');
                },
              ),
              ListTile(
                leading: Icon(Icons.attractions),
                title: Text("Eğlence Yerleri"),
                onTap: () {
                  Navigator.pushNamed(context, '/themeparks');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text("Çarşılar"),
                onTap: () {
                  Navigator.pushNamed(context, '/shopping');
                },
              ),
            ],
          ),
          Divider(thickness: 1, color: Colors.blueGrey, height: 20),
          ListTile(
            leading: Icon(Icons.directions),
            title: Text("Rota Planlayıcı"),
            onTap: () {
              Navigator.pushNamed(context, '/routeplanner');
            },
          ),
          Divider(thickness: 1, color: Colors.blueGrey, height: 20),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
