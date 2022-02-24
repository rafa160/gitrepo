import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:githubrepositories/blocs/repository_bloc.dart';
import 'package:githubrepositories/models/user_model.dart';
import 'package:githubrepositories/screens/info_user_details/info_user_details_screen.dart';


class InfoUserDetailsModule extends ModuleWidget {

  final UserModel userModel;

  InfoUserDetailsModule(this.userModel, {Key key});

  @override
  List<Bloc> get blocs => [
    Bloc((i) => RepositoryBloc())
  ];

  @override
  List<Dependency> get dependencies => [
  ];

  @override
  Widget get view => InfoUserDetailsScreen(userModel: userModel);

  static Inject get to => Inject<InfoUserDetailsModule>.of();
}