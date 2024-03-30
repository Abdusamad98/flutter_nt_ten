import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileModel {
  final String fullName;
  final String nickName;
  final String email;
  final String phone;
  final String country;
  final String address;
  final String profileId;
  final String gender;
  final String imageUrl;
  final LatLng latLng;

  ProfileModel({
    required this.email,
    required this.phone,
    required this.country,
    required this.profileId,
    required this.address,
    required this.gender,
    required this.fullName,
    required this.nickName,
    required this.latLng,
    required this.imageUrl,
  });

  ProfileModel copyWith({
    String? fullName,
    String? nickName,
    String? email,
    String? phone,
    String? country,
    String? address,
    String? profileId,
    String? gender,
    String? imageUrl,
    LatLng? latLng,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      address: address ?? this.address,
      profileId: profileId ?? this.profileId,
      gender: gender ?? this.gender,
      imageUrl: imageUrl ?? this.imageUrl,
      latLng: latLng ?? this.latLng,
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json["fullName"] as String? ?? "",
      nickName: json["nickName"] as String? ?? "",
      email: json["email"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      country: json["country"] as String? ?? "",
      address: json["address"] as String? ?? "",
      gender: json["gender"] as String? ?? "",
      profileId: json["profileId"] as String? ?? "",
      imageUrl: json["imageUrl"] as String? ?? "",
      latLng: LatLng(
        json["latitude"] as double? ?? 0.0,
        json["longitude"] as double? ?? 0.0,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "nickName": nickName,
      "email": email,
      "phone": phone,
      "country": country,
      "address": address,
      "gender": gender,
      "latitude": latLng.latitude,
      "longitude": latLng.longitude,
      "profileId": "",
      "imageUrl": imageUrl,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "fullName": fullName,
      "nickName": nickName,
      "email": email,
      "phone": phone,
      "country": country,
      "address": address,
      "gender": gender,
      "latitude": latLng.latitude,
      "longitude": latLng.longitude,
      "imageUrl": imageUrl,
    };
  }
}
