import 'package:flutter/material.dart';
import 'package:mntd_mobile/screens/home.dart';
import 'background.dart';
import 'package:mntd_mobile/Screens/Signup/signup_screen.dart';
import 'package:mntd_mobile/components/already_have_an_account_acheck.dart';
import 'package:mntd_mobile/components/rounded_button.dart';
import 'package:mntd_mobile/components/rounded_input_field.dart';
import 'package:mntd_mobile/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mntd_mobile/services/login_service.dart';

final LoginService loginService = LoginService();

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/iniciar-sesion.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Username",
              hintStyle: TextStyle(color: Colors.black),
              textStyle: TextStyle(color: Colors.black),
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              hintStyle: TextStyle(color: Colors.black),
              textStyle: TextStyle(color: Colors.black),
            ),
            RoundedButton(
              text: "LOGIN",
              color: Colors.green,
              press: () {
                loginService.login("mario", "msda930313@17");
                Navigator.of(context).pushReplacement(Home.route());
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
