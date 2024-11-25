class Contact {
  final int id;
  final String name;
  final String profilePicture;
  final String email;
  final String phoneNumber;
  final String tag;

  Contact({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.email,
    required this.phoneNumber,
    required this.tag,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      tag: json['tag'],
    );
  }
}
