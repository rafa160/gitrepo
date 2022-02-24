import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubrepositories/blocs/repository_bloc.dart';
import 'package:githubrepositories/components/custom_animated_container.dart';
import 'package:githubrepositories/components/custom_color_circular_progress_indicator.dart';
import 'package:githubrepositories/models/repo_model.dart';
import 'package:githubrepositories/models/user_model.dart';
import 'package:githubrepositories/screens/info_user_details/components/repo_card.dart';
import 'package:githubrepositories/screens/info_user_details/info_user_details_module.dart';
import 'package:githubrepositories/styles/strings.dart';
import 'package:githubrepositories/styles/style.dart';

class InfoUserDetailsScreen extends StatefulWidget {
  final UserModel userModel;

  const InfoUserDetailsScreen({Key key, this.userModel}) : super(key: key);

  @override
  _InfoUserDetailsScreenState createState() => _InfoUserDetailsScreenState();
}

class _InfoUserDetailsScreenState extends State<InfoUserDetailsScreen> {
  var repoBloc = InfoUserDetailsModule.to.getBloc<RepositoryBloc>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: CustomAnimatedContainer(
          milliseconds: 1200,
          horizontalOffset: -200,
          position: 1,
          widget: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.userModel.login ?? '',
              style: cardInfoText24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomAnimatedContainer(
                  milliseconds: 1200,
                  horizontalOffset: -200,
                  position: 1,
                  widget: Container(
                    height: 220,
                    width: 180,
                    decoration: BoxDecoration(
                      color: greyColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                            widget.userModel.avatarURL),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomAnimatedContainer(
                      milliseconds: 1200,
                      verticalOffset: 200,
                      position: 2,
                      widget: Text(
                        widget.userModel.bio,
                        style: textSpacingBlue12,
                      ),
                    ),
                  ),
                  Flexible(
                    child: CustomAnimatedContainer(
                      milliseconds: 1200,
                      verticalOffset: 200,
                      position: 3,
                      widget: Text(
                        widget.userModel.location,
                        style: textBoldGrey8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomAnimatedContainer(
                      milliseconds: 1200,
                      verticalOffset: 200,
                      position: 4,
                      widget: Text(
                        widget.userModel.company ?? Strings.NULL_TEXT_ORG,
                        style: textSpacingBlue12,
                      ),
                    ),
                  ),
                  Flexible(
                    child: CustomAnimatedContainer(
                      milliseconds: 1200,
                      verticalOffset: 200,
                      position: 5,
                      widget: Text(
                        '${Strings.FOLLOWERS_TEXT} ${widget.userModel.followers}',
                        style: textSpacingBlue12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              CustomAnimatedContainer(
                milliseconds: 1200,
                verticalOffset: 300,
                horizontalOffset: 130,
                position: 6,
                widget: Text(
                  Strings.REPO_TEXT,
                  style: cardInfoText24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: repoBloc.fetchRepositories(widget.userModel.login),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CustomColorCircularProgressIndicator(),
                        );
                      default:
                        if (!snapshot.hasData || snapshot.hasError) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(child: Text(Strings.FAIL_MESSAGE)),
                          );
                        }
                    }
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: repoBloc.repositories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          RepoModel repo = snapshot.data[index];
                          return RepoCard(repoModel: repo);
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
