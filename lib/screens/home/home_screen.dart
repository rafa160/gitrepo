import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:githubrepositories/blocs/user_bloc.dart';
import 'package:githubrepositories/components/custom_animated_container.dart';
import 'package:githubrepositories/components/custom_color_circular_progress_indicator.dart';
import 'package:githubrepositories/components/custom_colored_button.dart';
import 'package:githubrepositories/components/custom_form_field.dart';
import 'package:githubrepositories/screens/home/home_module.dart';
import 'package:githubrepositories/styles/strings.dart';
import 'package:githubrepositories/styles/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  var userBloc = HomeModule.to.getBloc<UserBloc>();

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
          elevation: 0,
          backgroundColor: backgroundColor,
          leading: Hero(
            tag: 'logo1',
            child: Image.asset(
              'assets/images/github.png',
              scale: 1,
            ),
          ),
          centerTitle: true,
          title: CustomAnimatedContainer(
              milliseconds: 1200,
              horizontalOffset: -200,
              position: 1,
              widget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  Strings.APP_NAME,
                  style: cardInfoText24,
                ),
              )),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAnimatedContainer(
                  milliseconds: 1200,
                  horizontalOffset: 200,
                  position: 2,
                  widget: Text(
                    Strings.TEXT_HOME_TITLE,
                    style: homeTitleSpacingBoldText16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomAnimatedContainer(
                  milliseconds: 1200,
                  horizontalOffset: 200,
                  position: 3,
                  widget: CustomFormField(
                    text: 'login',
                    initialValue: "",
                    hint: Strings.FORM_HINT,
                    enabled: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    action: TextInputAction.done,
                    type: TextInputType.text,
                    obscureText: false,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: CustomAnimatedContainer(
                    milliseconds: 1200,
                    horizontalOffset: 200,
                    position: 4,
                    widget:  StreamBuilder(
                      stream: null,
                      initialData: const [],
                      builder: (context, snapshot) {
                        if(snapshot.data != true) {
                          return CustomContainerButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                await userBloc.fetchUser(_formKey.currentState.value['login']);
                              }
                            },
                            widget: Text(Strings.SEARCH_TEXT_BUTTON, style: textBoldWhite14Space2,),
                          );
                        } else {
                          return CustomContainerButton(
                            onPressed: () async { },
                            widget: const CustomColorCircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),


                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
