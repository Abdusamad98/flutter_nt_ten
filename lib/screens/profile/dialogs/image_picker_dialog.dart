import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/size/size_utils.dart';
import 'package:image_picker/image_picker.dart';

class SelectedImageData {
  final XFile image;
  final String storagePathMade;

  SelectedImageData({
    required this.storagePathMade,
    required this.image,
  });
}

imagePickerDialog({
  required BuildContext context,
  required ValueChanged<SelectedImageData> onImageSelected,
}) {
  final ImagePicker picker = ImagePicker();

  String storagePath = "";

  Future<void> getImageFromCamera() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      onImageSelected.call(
        SelectedImageData(
          storagePathMade: storagePath,
          image: image,
        ),
      );
    }
  }

  Future<void> getImageFromGallery() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      onImageSelected.call(
        SelectedImageData(
          storagePathMade: storagePath,
          image: image,
        ),
      );
    }
  }

  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    )),
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          ListTile(
            onTap: () async {
              await getImageFromGallery();
              Navigator.pop(context);
            },
            leading: const Icon(Icons.photo_album_outlined),
            title: const Text("Gallereyadan olish"),
          ),
          ListTile(
            onTap: () async {
              await getImageFromCamera();
              Navigator.pop(context);
            },
            leading: const Icon(Icons.camera_alt),
            title: const Text("Kameradan olish"),
          ),
          SizedBox(height: 24.h),
        ],
      );
    },
  );
}
