import 'package:emojis/emojis.dart';
import 'package:get/get.dart';
import 'package:githubrepositories/models/repo_model.dart';
import 'package:githubrepositories/networking/wab_api_base.dart';
import 'package:githubrepositories/services/github_api.dart';
import 'package:githubrepositories/styles/strings.dart';

class RepositoriesService extends WebApiBase {

  Future<List<RepoModel>> getRepositoriesByUserLogin(String userLogin) async {
    try {
      var result = await get(controller: '${GitHubApi.users}${'/'}$userLogin${GitHubApi.repos}');
      return result.dataList.map<RepoModel>((map) {
        var repos = RepoModel.fromJson(map);
        return repos;
      }).toList();
    } catch (e) {
      Get.snackbar('${Emojis.brokenHeart} ${Strings.SNACKBAR_REPO_TITLE}',
          '${Strings.SNACKBAR_REPO_SUBTITLE} $userLogin ${Emojis.alienMonster}',
          snackStyle: SnackStyle.GROUNDED, snackPosition: SnackPosition.TOP);
      return null;
    }
  }

}