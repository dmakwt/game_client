import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:game_client/ui/shared/game_colors.dart';
import 'package:game_client/ui/shared/widgets/custom_long_button.dart';
import 'package:game_client/ui/shared/widgets/input_field.dart';
import 'package:game_client/view_models/login/manage_login_screen_viewmodel.dart';

class ForgetPasswordDialog extends StatelessWidget {
  final ManageLoginScreenViewModel model;
  final TextEditingController textEditingController;

  const ForgetPasswordDialog({this.model, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 210,
        width: 400,
        decoration: BoxDecoration(
            color: GameColors.backgroundColor2,
            borderRadius: BorderRadius.circular(14.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            InputField(
              autoFocus: true,
              focusNode: FocusNode(),
              nextFocusNode: FocusNode(),
              placeholder: 'Email',
              textInputAction: TextInputAction.done,
              icon: FontAwesomeIcons.at,
              controllerField: textEditingController,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomLongButton(
                text: 'Reset Password',
                onPressed: () async {
                  await model.resetPassword(
                    context,
                    email: textEditingController.text,
                  );
                })
          ],
        ),
      ),
    );
  }
}
