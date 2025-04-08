import 'package:flutter/material.dart';

class RotaPlanlayici extends StatefulWidget {
  const RotaPlanlayici({super.key});

  @override
  RotaPlanlayiciState createState() => RotaPlanlayiciState();
}

class RotaPlanlayiciState extends State<RotaPlanlayici> {
  List<String> semtler = ['Kadıköy', 'Beşiktaş', 'Fatih', 'Beyoğlu', 'Üsküdar'];
  String? secilenSemt;
  bool rotaOlusturuldu = false;

  Map<String, List<String>> rotalar = {
    'Kadıköy': [
      'Kadıköy İskelesi',
      'Moda Sahili',
      'Haydarpaşa Garı',
      'Bahariye Caddesi',
      'Fenerbahçe Parkı',
      'Yoğurtçu Parkı',
    ],
    'Beşiktaş': [
      'Dolmabahçe Sarayı',
      'Beşiktaş Meydanı',
      'Çırağan Sarayı',
      'Yıldız Parkı',
      'Ihlamur Kasrı',
      'Sinan Paşa Camii',
      'Akatlar Kültür Merkezi',
    ],
    'Fatih': [
      'Sultanahmet Camii',
      'Topkapı Sarayı',
      'Ayasofya',
      'Kapalıçarşı',
      'Süleymaniye Camii',
      'Yerebatan Sarnıcı',
      'Eminönü Meydanı',
      'Gülhane Parkı',
    ],
    'Beyoğlu': [
      'Taksim Meydanı',
      'İstiklal Caddesi',
      'Galata Kulesi',
      'Pera Müzesi',
      'Cihangir Sokakları',
      'Çiçek Pasajı',
      'Galata Mevlevihanesi',
    ],
    'Üsküdar': [
      'Çamlıca Tepesi',
      'Kız Kulesi',
      'Beylerbeyi Sarayı',
      'Fethi Paşa Korusu',
      'Mihrimah Sultan Camii',
      'Validebağ Korusu',
      'Şemsi Paşa Camii',
    ],
  };

  List<String> secilenRota() {
    if (secilenSemt != null) {
      return rotalar[secilenSemt] ?? [];
    }
    return [];
  }

  void rotaOlustur() {
    if (secilenSemt == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lütfen bir semt seçin!")),
      );
    } else {
      setState(() {
        rotaOlusturuldu = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rota Planlayıcı'),
        backgroundColor: Colors.teal[50],
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bir Semt Seçin:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[700]),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1.5),
                color: Colors.white,
              ),
              child: DropdownButton<String>(
                hint: Text('Semt Seçiniz', style: TextStyle(color: Colors.grey)),
                value: secilenSemt,
                onChanged: (String? yeniDeger) {
                  setState(() {
                    secilenSemt = yeniDeger;
                    rotaOlusturuldu = false;
                  });
                },
                isExpanded: true,
                icon: Icon(Icons.arrow_drop_down, color: Colors.teal),
                items: semtler.map((semt) {
                  return DropdownMenuItem<String>(
                    value: semt,
                    child: Text(semt, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),

            GestureDetector(
              onTap: rotaOlustur,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.greenAccent.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.4),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.alt_route_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Rota Oluştur',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            if (rotaOlusturuldu && secilenSemt != null) ...[
              Text(
                'Seçilen Semte Göre Rota:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[700]),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: secilenRota().length,
                  itemBuilder: (context, index) {
                    final yer = secilenRota()[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 10),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        title: Text(yer, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        trailing: Icon(Icons.place, color: Colors.teal[700]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
