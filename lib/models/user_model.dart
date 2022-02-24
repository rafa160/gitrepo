class UserModel {

  int id;
  String login;
  String avatarURL;
  String company;
  String bio;
  String location;
  int repositories;
  int followers;

  UserModel({this.id, this.login, this.avatarURL, this.company, this.bio,
      this.location, this.repositories, this.followers});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      login: json['login'] ?? '',
      location: json['location'] ?? '',
      avatarURL: json['avatar_url'] ?? '',
      company: json['company'],
      bio: json['bio'],
      repositories: json['public_repos'],
      followers: json['followers']
    );
  }

  @override
  String toString() {
    return 'UserModel{id: $id, login: $login, avatarURL: $avatarURL, company: $company, bio: $bio, location: $location, repositories: $repositories, followers: $followers}';
  }
}