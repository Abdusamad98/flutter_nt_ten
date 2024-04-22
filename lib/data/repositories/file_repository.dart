import 'package:flutter_nt_ten/data/models/file_data_model.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';

class FileRepository {
  List<FileDataModel> files = [
    FileDataModel(
      iconPath: AppImages.boy,
      fileName: "PythonBooks",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
    ),
    FileDataModel(
      iconPath: AppImages.boy,
      fileName: "Mountains2",
      fileUrl: "https://cdn.pixabay.com/video/2020/09/02/48873-457671829_large.mp4",
    ),
  ];
}
