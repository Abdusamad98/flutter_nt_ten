import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/view_models/profile_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({
    super.key,
  });

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onCameraIdle: () {
              if (cameraPosition != null) {
                context.read<ProfileViewModel>().changeCurrentLocation(
                      cameraPosition!,
                    );
              }
            },
            onCameraMove: (CameraPosition currentCameraPosition) {
              cameraPosition = currentCameraPosition;
            },
            initialCameraPosition:
                context.read<ProfileViewModel>().initialCameraPosition,
            onMapCreated: (GoogleMapController createdController) {
              context
                  .read<ProfileViewModel>()
                  .controller
                  .complete(createdController);
            },
          ),
          Align(
            child: Image.asset(
              AppImages.location,
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            top: 100,
            right: 0,
            left: 0,
            child: Text(
              context.watch<ProfileViewModel>().currentPlaceName,
              textAlign: TextAlign.center,
              style: AppTextStyle.interSemiBold.copyWith(
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            bottom: height / 5,
            right: width / 5,
            left: width / 5,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "SELECT ADDRESS",
                    style: AppTextStyle.interSemiBold
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 24),
                  const Icon(
                    Icons.place,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProfileViewModel>().moveToInitialPosition();
        },
        child: const Icon(Icons.gps_fixed),
      ),
    );
  }
}
