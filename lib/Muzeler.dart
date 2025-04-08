import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Secenekler.dart';
import 'model/Museum.dart';

class Muzeler extends StatefulWidget {
  const Muzeler({super.key});

  @override
  State<Muzeler> createState() => _MuzelerState();
}

class _MuzelerState extends State<Muzeler> {
  List<Museum> _muzeler = [];

  @override
  void initState() {
    super.initState();
    loadMuzeler();
  }

  Future<void> loadMuzeler() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response) as Map<String, dynamic>;

      setState(() {
        _muzeler = (data['muzeler'] as List)
            .map((e) => Museum.fromJson(e))
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
        title: Text(style: GoogleFonts.raleway(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        "Müzeler",),
        backgroundColor: Colors.teal[50],
      ),
      drawer: Secenekler(),
      body: _muzeler.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _muzeler.length,
        itemBuilder: (context, index) {
          final muze = _muzeler[index];
          return MuzelerCard(muze: muze);
        },
      ),
    );
  }
}

class MuzelerCard extends StatelessWidget {
  final Museum muze;

  const MuzelerCard({super.key, required this.muze});

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
            child: muze.imageUrl.isNotEmpty
                ? Image.network(
              muze.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              muze.name,
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
                    Text(muze.description, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Adres: ${muze.address}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Text("Giriş Ücreti: ${muze.girisUcreti}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
