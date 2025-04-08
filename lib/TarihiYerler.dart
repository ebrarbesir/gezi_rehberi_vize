import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Secenekler.dart';
import 'model/Historical.dart';

class TarihiYerler extends StatefulWidget {
  const TarihiYerler({super.key});

  @override
  State<TarihiYerler> createState() => _TarihiYerlerState();
}

class _TarihiYerlerState extends State<TarihiYerler> {
  List<Historical> _tarihiYerler = [];

  @override
  void initState() {
    super.initState();
    loadTarihiYerler();
  }
  Future<void> loadTarihiYerler() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response) as Map<String, dynamic>;

      setState(() {
        _tarihiYerler = (data['tarihiYerler'] as List)
            .map((e) => Historical.fromJson(e))
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
        title: Text("Tarihi Yerler",
        style: GoogleFonts.raleway(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        backgroundColor: Colors.teal[50],
      ),
      drawer: Secenekler(),
      body: _tarihiYerler.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _tarihiYerler.length,
        itemBuilder: (context, index) {
          final yer = _tarihiYerler[index];
          return TarihiYerCard(historical: yer);
        },
      ),
    );
  }
}

class TarihiYerCard extends StatelessWidget {
  final Historical historical;

  const TarihiYerCard({super.key, required this.historical});

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
            child: historical.imageUrl.isNotEmpty
                ? Image.network(
              historical.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Placeholder(fallbackHeight: 200, fallbackWidth: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              historical.name,
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
                    Text(historical.description, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text("Adres: ${historical.address}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Text("Giriş Ücreti: ${historical.girisUcreti}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
