import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubrepositories/models/repo_model.dart';
import 'package:githubrepositories/services/repositories_service.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import '';

class MockApiCallService extends Mock implements RepositoriesService {}

main() {
  MockApiCallService mockApiCallService;
  PublishSubject<List<RepoModel>> syncStreamController;

  setUp((){
    mockApiCallService = MockApiCallService();
    syncStreamController = PublishSubject<List<RepoModel>>();
  });

  tearDown(() {
    syncStreamController.close();
  });

  group('api test', () {
    final jsonMap = {
      "data": [
        {
          "id": 183650384,
          "name": "agenda",
          "description": "It is a basic project in AngularJS and HTML5 to understand how to use some concepts in Angular routes and others codes.",
          "stargazers_count": 9,
          "language": "Flutter",
          "url": "https://api.github.com/repos/rafa160/agenda",
          "owner": {
            "id": 37839608,
            "login": "rafa160",
            "avatar_url": "https://avatars.githubusercontent.com/u/37839608?v=4",
          }
        }
      ]
    };

    test('Check if returns the Repositories', () async {
      print("You have enter in the test\n");
      const String userLogin = 'rafa160';
      final httpResponse = Response(data: jsonMap, statusCode: 200, requestOptions: null);
      final list = (httpResponse.data['data']).map((e) => RepoModel.fromJson(e)).toList();
      List<RepoModel> expected = list;

      when(mockApiCallService.getRepositoriesByUserLogin(userLogin)).thenAnswer((_) async => list);

      expect(expected, list);
      print("You have pass the test");
    });
  });
}