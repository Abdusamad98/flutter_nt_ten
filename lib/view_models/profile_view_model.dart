import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_nt_ten/data/api_provider/api_provider.dart';
import 'package:flutter_nt_ten/data/models/profile_fields.dart';
import 'package:flutter_nt_ten/data/models/profile_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel() {
    getUserLocation();
    getUser();
  }

  bool _isLoading = false;

  bool get getLoader => _isLoading;

  ProfileModel profileModel = ProfileModel(
    email: "",
    phone: "",
    country: "",
    profileId: "",
    address: "",
    gender: "",
    fullName: "",
    nickName: "",
    latLng: const LatLng(0, 0),
    imageUrl: "",
  );

  updateFields({
    required dynamic value,
    required ProfileFields field,
  }) {
    switch (field) {
      case ProfileFields.fullName:
        profileModel = profileModel.copyWith(fullName: value as String);
        break;
      case ProfileFields.nickName:
        profileModel = profileModel.copyWith(nickName: value as String);
        break;
      case ProfileFields.email:
        profileModel = profileModel.copyWith(email: value as String);
        break;
      case ProfileFields.phone:
        profileModel = profileModel.copyWith(phone: value as String);
        break;
      case ProfileFields.country:
        profileModel = profileModel.copyWith(country: value as String);
        break;
      case ProfileFields.address:
        profileModel = profileModel.copyWith(address: value as String);
        break;
      case ProfileFields.gender:
        profileModel = profileModel.copyWith(gender: value as String);
        break;
      case ProfileFields.latLng:
        profileModel = profileModel.copyWith(latLng: value as LatLng);
        break;
      case ProfileFields.imageUrl:
        profileModel = profileModel.copyWith(imageUrl: value as String);
        break;
    }
    notifyListeners();
  }

  late CameraPosition initialCameraPosition;
  late CameraPosition currentCameraPosition;
  String currentPlaceName = "";
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  insertUser(ProfileModel profileModel) async {
    try {
      _notify(true);
      var cf = await FirebaseFirestore.instance
          .collection("users")
          .add(profileModel.toJson());

      await FirebaseFirestore.instance
          .collection("users")
          .doc(cf.id)
          .update({"profileId": cf.id});
      _notify(false);
    } on FirebaseException catch (error) {}
  }

  updateProfile() async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(profileModel.profileId)
          .update(profileModel.toJsonForUpdate());

      _notify(false);
    } on FirebaseException catch (error) {}
  }

  Future<void> getUser() async {
    _notify(true);
    await FirebaseFirestore.instance.collection("users").get().then((snapshot) {
      var users =
          snapshot.docs.map((e) => ProfileModel.fromJson(e.data())).toList();
      if (users.isNotEmpty) {
        profileModel = users[0];
      }
    });
    _notify(false);
  }

  deleteProfile(
    String docId,
  ) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance.collection("users").doc(docId).delete();
      _notify(false);
    } on FirebaseException catch (error) {}
  }

  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }

// Google Maps side

  moveToInitialPosition() async {
    final GoogleMapController mapController = await controller.future;
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition!));
  }

  setLatInitialLong(LatLng latLng) {
    initialCameraPosition = CameraPosition(
      target: latLng,
      zoom: 15,
    );
    notifyListeners();
  }

  changeCurrentLocation(CameraPosition cameraPosition) async {
    currentCameraPosition = cameraPosition;
    currentPlaceName = await ApiProvider.getPlaceNameByLocation(cameraPosition.target);
    profileModel = profileModel.copyWith(
      address: currentPlaceName,
      latLng: currentCameraPosition.target,
    );
    notifyListeners();
  }

  Future<void> getUserLocation() async {
    Location location = Location();
    bool serviceEnabled = false;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setLatInitialLong(LatLng(locationData.latitude!, locationData.longitude!));

    debugPrint("LONGITUDE:${locationData.longitude}");
    debugPrint("LATITUDE:${locationData.latitude}");
    debugPrint("SPEED:${locationData.speed}");
    debugPrint("ALTITUDE:${locationData.altitude}");
  }

  //Upload image

  Future<void> uploadImage({
    required XFile pickedFile,
    required String storagePath,
  }) async {
    try {
      var ref = FirebaseStorage.instance.ref().child(storagePath);
      _notify(true);
      File file = File(pickedFile.path);
      var uploadTask = await ref.putFile(file);
      String downloadUrl = await uploadTask.ref.getDownloadURL();
      profileModel = profileModel.copyWith(imageUrl: downloadUrl);
      if (profileModel.profileId.isEmpty) {
        await insertUser(profileModel);
      } else {
        await updateProfile();
      }
      _notify(false);
    } on FirebaseException catch (error) {
      throw Exception();
    }
  }
}
