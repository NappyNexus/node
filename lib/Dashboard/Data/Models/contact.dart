class Contact {
  final int id;
  final String name;
  final String profilePicture;
  final String phoneNumber;
  final String tag;

  Contact({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.phoneNumber,
    required this.tag,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      profilePicture: json['profilePicture'],
      phoneNumber: json['phoneNumber'],
      tag: json['tag'],
    );
  }
}
