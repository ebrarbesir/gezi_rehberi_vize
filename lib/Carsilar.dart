import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Secenekler.dart';
import 'model/Shopping.dart';

class Alisveris extends StatefulWidget {
  const Alisveris({super.key});

  @override
  State<Alisveris> createState() => _AlisverisState();
}

class _AlisverisState extends State<Alisveris> {
  List<Shopping> _alisverisYerleri = [];

  @override
  void initState() {
    super.initState();
    loadAlisverisYerleri();
  }

  Future<void> loadAlisverisYerleri() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response) as Map<String, dynamic>;

      setState(() {
        _alisverisYerleri = (data['carsilar'] as List)
            .map((e) => Shopping.fromJson(e))
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
        title: Text("Alışveriş Yerleri",
        style: GoogleFonts.raleway(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        backgroundColor: Colors.teal[50],
      ),
      drawer: Secenekler(),
      body: _alisverisYerleri.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _alisverisYerleri.length,
        itemBuilder: (context, index) {
          final shop = _alisverisYerleri[index];
          return AlisverisCard(shop: shop);
        },
      ),
    );
  }
}

class AlisverisCard extends StatelessWidget {
  final Shopping shop;

  const AlisverisCard({super.key, required this.shop});

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
            child: shop.imageUrl.isNotEmpty
                ? Image.network(
              shop.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              shop.name,
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
                    Text(shop.description, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Adres: ${shop.address}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Text("Giriş Ücreti: ${shop.girisUcreti}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
