class Nature {
  final String name;
  final String imageUrl;
  final String description;
  final String address;
  final String girisUcreti;

  Nature({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.address,
    required this.girisUcreti,
  });

  factory Nature.fromJson(Map<String, dynamic> json) {
    return Nature(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      address: json['address'],
      girisUcreti: json['girisUcreti'],
    );
  }
}


