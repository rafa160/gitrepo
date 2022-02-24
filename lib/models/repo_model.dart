import 'package:githubrepositories/models/user_model.dart';

class RepoModel {

  int id;
  String name;
  UserModel userModel;
  String description;
  int stars;
  String language;
  String visibility;

  RepoModel({this.id, this.name, this.userModel, this.description, this.stars,
      this.language, this.visibility});

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
        id: json['id'],
        name: json['name'],
        userModel: UserModel.fromJson(json['owner']),
        description: json['description'],
        stars: json['stargazers_count'],
        language: json['language'],
        visibility: json['visibility'],
    );
  }
}