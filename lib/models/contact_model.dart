class ContactModel {
  final String phoneNumber;
  final String firstName;
  final String lastName;

  ContactModel({
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return '''
    Firstname:$firstName,
    LastName:$lastName,
    PhoneNumber:$phoneNumber,
''';
  }
}
