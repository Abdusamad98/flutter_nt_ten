import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/bloc/file_manager_bloc.dart';
import 'package:flutter_nt_ten/data/models/file_data_model.dart';
import 'package:flutter_nt_ten/data/models/file_status_model.dart';
import 'package:flutter_nt_ten/data/repositories/file_repository.dart';
import 'package:flutter_nt_ten/services/file_maneger_service.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:open_filex/open_filex.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("File Managaer Screen"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: List.generate(
          context.read<FileRepository>().files.length,
          (index) {
            FileDataModel fileDataModel =
                context.read<FileRepository>().files[index];

            FileManagerBloc fileManagerBloc = FileManagerBloc();

            return BlocProvider.value(
              value: fileManagerBloc,
              child: BlocBuilder<FileManagerBloc, FileManagerState>(
                builder: (context, state) {
                  debugPrint("CURRENT MB: ${state.progress}");
                  return Column(
                    children: [
                      ListTile(
                        title: Text(fileDataModel.fileName),
                        subtitle: Text(fileDataModel.fileUrl),
                        trailing: IconButton(
                          onPressed: () async {
                            if (state.newFileLocation.isEmpty) {
                              fileManagerBloc.add(
                                DownloadFileEvent(
                                  fileDataModel: fileDataModel,
                                ),
                              );
                            } else {
                              await OpenFilex.open(state.newFileLocation);
                            }
                          },
                          icon: FutureBuilder<FileStatusModel>(
                            future: FileManagerService.checkFile(fileDataModel),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                FileStatusModel status =
                                    snapshot.data as FileStatusModel;
                                return Icon(
                                  status.isExist ? Icons.check : Icons.download,
                                  color: Colors.blue,
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: state.progress != 0,
                        child: LinearProgressIndicator(
                          value: state.progress,
                          backgroundColor: Colors.grey,
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
