import 'package:flutter/material.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:mntd_mobile/screens/Secret/components/backdrop_action_secret.dart';
import 'package:mntd_mobile/screens/Secret/components/description_secret.dart';
import 'package:mntd_mobile/utils/constants.dart';

class SecretDeatilsScreen extends StatelessWidget {
  final Secret secret;
  final bool darkMode;

  const SecretDeatilsScreen({Key key, this.secret, this.darkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        secret: secret,
        darkMode: darkMode,
      ),
    );
  }
}

class Body extends StatelessWidget {
  final Secret secret;
  final bool darkMode;
  const Body({Key key, this.secret, this.darkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        BackdropAndActions(
          size: size,
          secret: secret,
          darkMode: darkMode,
        ),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        DescriptionSecret(secret: secret),
      ],
    );
  }
}
