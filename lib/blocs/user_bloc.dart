import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:get/get.dart';
import 'package:githubrepositories/models/user_model.dart';
import 'package:githubrepositories/screens/info_user_details/info_user_details_module.dart';
import 'package:githubrepositories/services/user_service.dart';

class UserBloc extends BlocBase {

  UserModel userModel;
  final UserService _userService = UserService();

  final StreamController<bool> _streamController =
      StreamController<bool>.broadcast();

  Stream get loadingStream => _streamController.stream;

  Sink get loadingSink => _streamController.sink;

  Future<UserModel> fetchUser(String userLogin) async {
    try {
      _streamController.add(true);
      userModel = await _userService.getUserFromGitHub(userLogin);
      if (userModel != null) {
        Get.to(() => InfoUserDetailsModule(userModel));
        _streamController.add(false);
      } else {
        return null;
      }
    } catch (e) {
      print('$e');
    }

    return userModel;
  }
}