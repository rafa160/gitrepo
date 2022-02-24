import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:githubrepositories/models/repo_model.dart';
import 'package:githubrepositories/services/repositories_service.dart';

class RepositoryBloc extends BlocBase {
  final StreamController<bool> _streamController =
  StreamController<bool>.broadcast();

  Stream get loadingStream => _streamController.stream;

  Sink get loadingSink => _streamController.sink;

  final RepositoriesService _repositoriesService = RepositoriesService();

  List repositories = [];
  Future<List<RepoModel>> fetchRepositories(String userLogin) async {
     return repositories = await _repositoriesService.getRepositoriesByUserLogin(userLogin);
  }

}