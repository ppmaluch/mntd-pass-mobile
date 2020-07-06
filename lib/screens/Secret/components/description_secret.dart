import 'package:flutter/material.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:mntd_mobile/utils/constants.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';

class DescriptionSecret extends StatelessWidget {
  const DescriptionSecret({
    Key key,
    @required this.secret,
  }) : super(key: key);

  final Secret secret;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    secret.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Row(
                    children: <Widget>[
                      Text(secret.username),
                      SizedBox(
                        width: kDefaultPadding / 2,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: kDefaultPadding),
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding / 4,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: GFColors.kPrimaryButtomColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(secret.category)),
                      SizedBox(
                        width: kDefaultPadding / 2,
                      ),
                      Expanded(
                        child: Text(
                          getTimeStamp(secret),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
