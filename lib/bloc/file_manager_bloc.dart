import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/data/models/file_data_model.dart';
import 'package:flutter_nt_ten/data/models/file_status_model.dart';
import 'package:flutter_nt_ten/services/file_maneger_service.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'file_manager_event.dart';

part 'file_manager_state.dart';

class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  FileManagerBloc()
      : super(
          const FileManagerState(
            progress: 0.0,
            newFileLocation: "",
          ),
        ) {
    on<DownloadFileEvent>(_downloadFile);
  }

  Future<void> _downloadFile(DownloadFileEvent event, emit) async {
    Dio dio = Dio();
    FileStatusModel fileStatusModel =
        await FileManagerService().checkFile(event.fileDataModel);
    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      await dio.download(
        event.fileDataModel.fileUrl,
        fileStatusModel.newFileLocation,
        onReceiveProgress: (count, total) async {
          emit(state.copyWith(progress: count / total));
        },
      );
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
    }

    // event.fileDataModel;
    // bool hasPermission = await _requestWritePermission();
    // if (!hasPermission) return;

    //
    // Directory? directory = await getDownloadPath();
    // String downloadUrl = event.fileDataModel.fileUrl;

    //users/files/Download/PythonBook1.pdf
    //
    // String savedLocation =
    //     "${directory?.path}/${event.fileDataModel.fileName}${downloadUrl.substring(downloadUrl.length - 5, downloadUrl.length)}";
    //
    // debugPrint("SAQLANAYOTGAN FILE LOCATION:$savedLocation");
    //
    // var allFiles = directory?.list();
    //
    // List<String> filePaths = [];
    //
    // await allFiles?.forEach((element) {
    //   debugPrint("FILES IN DOWNLOAD FOLDER:${element.path}");
    //   filePaths.add(element.path.toString());
    // });

    // if (filePaths.contains(savedLocation)) {
    //   OpenFilex.open(savedLocation);
    //   emit(state.copyWith(newFileLocation: savedLocation));
    // } else {
    //   await dio.download(
    //     downloadUrl,
    //     savedLocation,
    //     onReceiveProgress: (count, total) {
    //       emit(
    //         state.copyWith(progress: count / total),
    //       );
    //     },
    //   );
    //   emit(
    //     state.copyWith(
    //       progress: 1,
    //       newFileLocation: savedLocation,
    //     ),
    //   );
    // }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }
}
