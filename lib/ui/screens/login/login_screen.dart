import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_client/services/service_locator.dart';
import 'package:game_client/ui/screens/login/widgets/custom_button.dart';
import 'package:game_client/ui/screens/login/widgets/game_logo.dart';
import 'package:game_client/ui/screens/login/widgets/input_field.dart';
import 'package:game_client/ui/shared/game_colors.dart';
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
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: topHeight),
              Container(
                height: 700,
                width: 700,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: GameLogo(),
                    ),
                    SizedBox(height: 45),
                    InputField(
                      controllerField: textController1,
                      keyboardType: TextInputType.emailAddress,
                      icon: FontAwesomeIcons.at,
                      placeholder: 'EMAIL',
                    ),
                    SizedBox(height: 10),
                    InputField(
                      controllerField: textController2,
                      keyboardType: TextInputType.visiblePassword,
                      isObscure: true,
                      icon: FontAwesomeIcons.lock,
                      placeholder: 'PASSWORD',
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'LOG IN',
                      onPressed: () {
                       
                      },
                    ),
                    SizedBox(height: 15),
                    FlatButton(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'DON\'T HAVE AN ACCOUNT?',
                              style: TextStyle(
                                color: GameColors.textColor.withOpacity(0.7),
                                fontFamily: 'PTSerif',
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: '   SIGN UP',
                              style: TextStyle(
                                fontFamily: 'PTSerif',
                                color: GameColors.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
