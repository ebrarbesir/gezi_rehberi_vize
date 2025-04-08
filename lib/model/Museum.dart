class Museum {
  final String imageUrl;
  final String name;
  final String description;
  final String address;
  final String girisUcreti;

  Museum({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.address,
    required this.girisUcreti,
  });

  factory Museum.fromJson(Map<String, dynamic> json) {
    return Museum(
      imageUrl: json['imageUrl'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      girisUcreti: json['girisUcreti'],
    );
  }
}

