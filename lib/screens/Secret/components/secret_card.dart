import 'package:flutter/material.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:mntd_mobile/screens/Secret/secret_details.dart';
import 'package:mntd_mobile/utils/constants.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';

class SecretCard extends StatelessWidget {
  final Secret secret;
  final bool darkMode;
  const SecretCard({Key key, this.secret, this.darkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecretDeatilsScreen(
                darkMode: darkMode,
                secret: secret,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                    image: AssetImage(secret.img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                secret.name,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: kDefaultPadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding / 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: GFColors.kPrimaryButtomColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    secret.category,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                ),
                SizedBox(
                  width: kDefaultPadding / 2,
                ),
                Expanded(
                  child: Text(
                    getTimeStamp(secret),
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
