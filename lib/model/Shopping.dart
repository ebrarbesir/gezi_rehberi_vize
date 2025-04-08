class Shopping {

  final String imageUrl;
  final String name;
  final String description;
  final String address;
  final String girisUcreti;

  Shopping({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.address,
    required this.girisUcreti,

  });

  factory Shopping.fromJson(Map<String, dynamic> json) {
    return Shopping(
      imageUrl: json['imageUrl'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      girisUcreti: json['girisUcreti'],

    );

  }

}

