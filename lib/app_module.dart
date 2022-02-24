import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:githubrepositories/app_widget.dart';


class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
  ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => const AppWidget();

  static Inject get to => Inject<AppModule>.of();
}