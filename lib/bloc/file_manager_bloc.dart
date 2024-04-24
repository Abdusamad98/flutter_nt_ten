import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/data/models/file_data_model.dart';
import 'package:flutter_nt_ten/data/models/file_status_model.dart';
import 'package:flutter_nt_ten/services/file_manager_service.dart';
import 'package:open_filex/open_filex.dart';

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

    FileStatusModel fileStatusModel = await getStatus(event.fileDataModel);

    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      ReceivePort receivePort = ReceivePort();

      Isolate.spawn(
        (SendPort sendPort) async {
          double d = 0.0;
          dio.download(
            event.fileDataModel.fileUrl,
            fileStatusModel.newFileLocation,
            onReceiveProgress: (count, total) async {
              d = count / total;
              Isolate.exit(sendPort, d);
            },
          );
        },
        receivePort.sendPort,
      );

      receivePort.listen((message) {
        //emit(state.copyWith(progress: message));
        print("Message:$message");
      });

      await FileManagerService.init();
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
    }
  }
}

Future<FileStatusModel> getStatus(FileDataModel fileDataModel) async {
  final FileStatusModel fileStatusModel =
      await Isolate.run<FileStatusModel>(() async {
    return await FileManagerService.checkFile(fileDataModel);
  });
  return fileStatusModel;
}
