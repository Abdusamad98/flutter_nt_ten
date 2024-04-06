import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
