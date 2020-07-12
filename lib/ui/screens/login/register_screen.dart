import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:game_client/ui/screens/login/widgets/game_logo.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/ui/shared/widgets/custom_button.dart';
import 'package:game_client/ui/shared/widgets/input_field.dart';
import 'package:game_client/view_models/login/manage_login_screen_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  final PageController pageViewController;
  final ManageLoginScreenViewModel model;

  RegisterScreen({@required this.pageViewController, @required this.model});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();

    super.dispose();
  }

  double caculateTopHeight(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.height >= 1000) {
      return 300;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final topHeight = caculateTopHeight(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: topHeight),
              Container(
                height: 700,
                width: 700,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: GameLogo(),
                      ),
                      SizedBox(height: 30),
                      InputField(
                        focusNode: focus1,
                        nextFocusNode: focus2,
                        controllerField: textController1,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        icon: FontAwesomeIcons.userAlt,
                        placeholder: 'Username',
                      ),
                      SizedBox(height: 10),
                      InputField(
                        focusNode: focus2,
                        nextFocusNode: focus3,
                        controllerField: textController2,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        icon: FontAwesomeIcons.at,
                        placeholder: 'Email',
                      ),
                      SizedBox(height: 10),
                      InputField(
                        focusNode: focus3,
                        nextFocusNode: FocusNode(),
                        controllerField: textController3,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: true,
                        icon: FontAwesomeIcons.lock,
                        placeholder: 'Password',
                      ),
                      SizedBox(height: 30),
                      CustomButton(
                        text: 'Sign Up',
                        onPressed: () async {
                          await widget.model.signUpUser(
                            context,
                            username: textController1.text,
                            email: textController2.text,
                            password: textController3.text,
                          );
                          // widget.model.turnLoading();
                        },
                      ),
                      SizedBox(height: 15),
                      FlatButton(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'I have an account?',
                                style: TextStyle(
                                  color: GameColors.textColor.withOpacity(0.7),
                                  fontFamily: 'PTSerif',
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: '   LOGIN',
                                style: TextStyle(
                                  fontFamily: 'PTSerif',
                                  color: GameColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          widget.pageViewController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
