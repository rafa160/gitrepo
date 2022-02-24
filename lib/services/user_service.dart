import 'dart:async';

import 'package:emojis/emojis.dart';
import 'package:get/get.dart';
import 'package:githubrepositories/models/user_model.dart';
import 'package:githubrepositories/networking/wab_api_base.dart';
import 'package:githubrepositories/services/github_api.dart';
import 'package:githubrepositories/styles/strings.dart';

class UserService extends WebApiBase {
  final StreamController<bool> _streamController =
      StreamController<bool>.broadcast();

  Stream get loadingStream => _streamController.stream;

  Sink get loadingSink => _streamController.sink;

  Future<UserModel> getUserFromGitHub(String userLogin) async {
    try {
      var result = await get(controller: '${GitHubApi.users}${'/'}$userLogin');
      return UserModel.fromJson(result.data);
    } catch (e) {
      _streamController.add(false);
      Get.snackbar('${Emojis.brokenHeart} ${Strings.SNACKBAR_USER_TITLE}',
          '${Strings.SNACKBAR_USER_SUBTITLE} ${Emojis.alienMonster}',
          snackStyle: SnackStyle.GROUNDED, snackPosition: SnackPosition.TOP);
      return null;
    }
  }
}
