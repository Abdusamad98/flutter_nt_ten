import 'package:flutter_nt_ten/models/contact_model.dart';

List<ContactModel> contacts = [
  ...List.generate(
    100,
    (index) => ContactModel(
      lastName: "Falonchiyev",
      firstName: "Pistonchi",
      phoneNumber: "+99899 123 45 67",
    ),
  )
];
