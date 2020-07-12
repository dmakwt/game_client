import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:game_client/ui/screens/login/widgets/forget_password_dialog.dart';
import 'package:game_client/ui/screens/login/widgets/game_logo.dart';
import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/ui/shared/widgets/custom_button.dart';
import 'package:game_client/ui/shared/widgets/input_field.dart';
import 'package:game_client/view_models/login/manage_login_screen_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  final PageController pageViewController;
  final ManageLoginScreenViewModel model;

  LoginScreen({@required this.pageViewController, @required this.model});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();

  final focus1 = FocusNode();
  final focus2 = FocusNode();

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    focus1.dispose();
    focus2.dispose();

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
                      SizedBox(height: 45),
                      InputField(
                        focusNode: focus1,
                        nextFocusNode: focus2,
                        controllerField: textController1,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        icon: FontAwesomeIcons.at,
                        placeholder: 'Email',
                      ),
                      SizedBox(height: 10),
                      InputField(
                        focusNode: focus2,
                        nextFocusNode: FocusNode(),
                        controllerField: textController2,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        isObscure: true,
                        icon: FontAwesomeIcons.lock,
                        placeholder: 'Password',
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 60),
                        child: FlatButton(
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: GameColors.textColor.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ForgetPasswordDialog(
                                model: widget.model,
                                textEditingController: textController1,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      CustomButton(
                        text: 'Login',
                        onPressed: () async {
                          await widget.model.signInUser(
                            context,
                            email: textController1.text,
                            password: textController2.text,
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      FlatButton(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Don\'t have an account?',
                                style: TextStyle(
                                  color: GameColors.textColor.withOpacity(0.7),
                                  fontFamily: 'PTSerif',
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: '   SIGN UP',
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
                            1,
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
