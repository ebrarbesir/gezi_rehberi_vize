import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Secenekler.dart';
import 'model/Fun.dart';

class Eglence extends StatefulWidget {
  const Eglence({super.key});

  @override
  State<Eglence> createState() => _EglenceState();
}

class _EglenceState extends State<Eglence> {
  List<Fun> _eglenceYerleri = [];

  @override
  void initState() {
    super.initState();
    loadEglenceYerleri();
  }

  Future<void> loadEglenceYerleri() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response) as Map<String, dynamic>;

      setState(() {
        _eglenceYerleri = (data['eglenceYerleri'] as List)
            .map((e) => Fun.fromJson(e))
            .toList();
      });
    } catch (e) {
      if (kDebugMode) {
        print("Hata oluştu: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eğlence Yerleri",
        style: GoogleFonts.raleway(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.teal[50],
      ),
      drawer: Secenekler(),
      body: _eglenceYerleri.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _eglenceYerleri.length,
        itemBuilder: (context, index) {
          final yer = _eglenceYerleri[index];
          return EglenceYerCard(fun: yer);
        },
      ),
    );
  }
}

class EglenceYerCard extends StatelessWidget {
  final Fun fun;

  const EglenceYerCard({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: fun.imageUrl.isNotEmpty
                ? Image.network(
              fun.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              fun.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ExpansionTile(
            title: Text(
              "Detay",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fun.description, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Adres: ${fun.address}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Text("Giriş Ücreti: ${fun.girisUcreti}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
