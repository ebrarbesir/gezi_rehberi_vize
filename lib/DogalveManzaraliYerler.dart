import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Secenekler.dart';
import 'model/Nature.dart';

class Manzara extends StatefulWidget {
  const Manzara({super.key});

  @override
  State<Manzara> createState() => _ManzaraState();
}

class _ManzaraState extends State<Manzara> {
  List<Nature> _dogalAlanlar = [];

  @override
  void initState() {
    super.initState();
    loadDogalAlanlar();
  }

  Future<void> loadDogalAlanlar() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response) as Map<String, dynamic>;

      setState(() {
        _dogalAlanlar = (data['manzaralar'] as List)
            .map((e) => Nature.fromJson(e))
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
        title: Text("Doğal ve Manzaralı Yerler",
        style: GoogleFonts.raleway(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        backgroundColor: Colors.teal[50],
      ),
      drawer: Secenekler(),
      body: _dogalAlanlar.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _dogalAlanlar.length,
        itemBuilder: (context, index) {
          final alan = _dogalAlanlar[index];
          return ManzaraCard(nature: alan);
        },
      ),
    );
  }
}

class ManzaraCard extends StatelessWidget {
  final Nature nature;

  const ManzaraCard({super.key, required this.nature});

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
            child: nature.imageUrl.isNotEmpty
                ? Image.network(
              nature.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              nature.name,
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
                    Text(nature.description, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Adres: ${nature.address}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Text("Giriş Ücreti: ${nature.girisUcreti}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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