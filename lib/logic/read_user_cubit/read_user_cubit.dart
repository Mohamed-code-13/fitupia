import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user_data.dart';
import '../../presentation/helper/helper.dart';

part 'read_user_state.dart';

class ReadUserCubit extends Cubit<ReadUserState> {
  ReadUserCubit() : super(ReadUserInitial());

  UserData? userData;

  void getUser() {
    var userBox = Hive.box<UserData>(kUserBox);
    var users = userBox.values.toList();
    if (users.isEmpty) {
      emit(ReadUserNew());
    } else {
      userData = users[0];
      emit(ReadUserRegistered());
    }
  }
}
