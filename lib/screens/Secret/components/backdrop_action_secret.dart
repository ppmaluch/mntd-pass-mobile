import 'package:flutter/material.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:mntd_mobile/utils/constants.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';

class BackdropAndActions extends StatelessWidget {
  const BackdropAndActions({
    Key key,
    @required this.size,
    @required this.secret,
    this.darkMode,
  }) : super(key: key);

  final Size size;
  final Secret secret;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(getImagenByCategory(secret.category)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 100,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: darkMode ? GFColors.LIGHT : GFColors.DARK,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xff12153d).withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: darkMode ? GFColors.DARK : GFColors.LIGHT,
                  ),
                  Icon(
                    Icons.remove_red_eye,
                    color: darkMode ? GFColors.DARK : GFColors.LIGHT,
                  ),
                  Icon(
                    Icons.delete,
                    color: darkMode ? GFColors.DARK : GFColors.LIGHT,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
              child: BackButton(
            color: darkMode ? GFColors.DARK : GFColors.DARK,
          ))
        ],
      ),
    );
  }
}
