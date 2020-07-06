import 'package:flutter/material.dart';
import 'package:mntd_mobile/utils/constants.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';

class Categorylist extends StatefulWidget {
  final bool darkMode;
  Categorylist({Key key, this.darkMode}) : super(key: key);

  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  int selectedCategory = 0;
  List<String> categories = ["personal", "payments", "socials", "services"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index].toUpperCase(),
              style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == selectedCategory
                      ? widget.darkMode ? GFColors.DARK : GFColors.LIGHT
                      : Colors.grey.withOpacity(0.4)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? GFColors.kPrimaryButtomColor
                    : GFColors.TRANSPARENT,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
