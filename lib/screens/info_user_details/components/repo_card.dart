import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:githubrepositories/components/custom_animated_container.dart';
import 'package:githubrepositories/models/repo_model.dart';
import 'package:githubrepositories/styles/strings.dart';
import 'package:githubrepositories/styles/style.dart';

class RepoCard extends StatelessWidget {
  final RepoModel repoModel;
  const RepoCard({Key key, this.repoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 400,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAnimatedContainer(
                milliseconds: 1200,
                verticalOffset: 200,
                position: 1,
                widget: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/github.png',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomAnimatedContainer(
                      milliseconds: 1200,
                      verticalOffset: 200,
                      position: 2,
                      widget: FaIcon(
                        FontAwesomeIcons.star,
                        size: 12,
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Flexible(
                      child: CustomAnimatedContainer(
                        milliseconds: 1200,
                        verticalOffset: 200,
                        position: 3,
                        widget: Text(
                          '${repoModel.stars}',
                          style: textBoldGrey8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14, top: 8),
                  child: CustomAnimatedContainer(
                    milliseconds: 1200,
                    verticalOffset: 200,
                    position: 4,
                    widget: Text(
                      repoModel.description ?? Strings.NO_DESCRIPTION,
                      style: textBoldBlue12,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6, left: 6),
                  child: CustomAnimatedContainer(
                    milliseconds: 1200,
                    verticalOffset: 200,
                    position: 5,
                    widget: Text(
                      repoModel.language ?? '',
                      style: textSpacingBlue12,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ),
            ],),
        ),
      ),
    );
  }
}
