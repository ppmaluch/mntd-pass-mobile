import 'package:flutter/material.dart';
import 'package:mntd_mobile/components/menu_and_search.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:mntd_mobile/providers/SecretCardProvider.dart';
import 'package:mntd_mobile/providers/ThemeSettingProvider.dart';
import 'package:mntd_mobile/screens/Secret/secret_carousel.dart';
import 'package:mntd_mobile/services/secrets_service.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Secret/add_secrets.dart';
import 'Secret/components/category_secrets_list.dart';

class Home extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (cotext) => Home());
  }

  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Search state
  TextEditingController _searchController = new TextEditingController();
  bool _isSearching = false;
  // Secrets state
  List<Secret> secrets = [];
  double currentPage = .0;
  final SecretsService secretsService = SecretsService();
  var darkMode = false;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then(
      (prefs) {
        final dm = prefs.getBool('darkmode');
        if (dm != null) {
          setState(() {
            darkMode = dm;
          });

          Provider.of<ThemeSettingProvider>(context, listen: false)
              .updateTheme(dm);
        }
      },
    );
  }

  void searching() {}

  void onSearchCancel() {
    setState(() {
      _isSearching = false;
      _searchController.text = "";
    });
  }

  void startSearching() {
    setState(() {
      _isSearching = true;
      print(_isSearching);
    });
  }
  //End Search state

  @override
  Widget build(BuildContext context) {
    Provider.of<SecretCardProvider>(context).initialState();
    PageController controller =
        PageController(initialPage: secrets.reversed.length);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // menu & search actions
            _isSearching
                ? search(onSearchCancel, searching, _searchController, darkMode)
                : navBar(startSearching, darkMode),
            // SecretsPageScreen name text when will be show total of secrets by username
            // SizedBox(
            //   height: 10,
            // ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Icon(
                    Icons.lightbulb_outline,
                    color: darkMode ? GFColors.DARK : GFColors.LIGHT,
                  )),
                  Switch(
                    activeColor: Theme.of(context).focusColor,
                    value: darkMode,
                    onChanged: (value) {
                      setState(() {
                        darkMode = value;
                      });

                      Provider.of<ThemeSettingProvider>(context, listen: false)
                          .updateTheme(darkMode);

                      SharedPreferences.getInstance().then((prefs) {
                        prefs.setBool('darkmode', darkMode);
                      });
                    },
                  ),
                ],
              ),
            ),
            // Validate if secretCardProvider have data.
            (Provider.of<SecretCardProvider>(context).getSecretsdLength() > 0
                ? Consumer<SecretCardProvider>(
                    builder: (context, secrets, child) => SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Secrets #${secrets.getSecretsdLength()}",
                                  style: TextStyle(
                                      color: darkMode
                                          ? GFColors.DARK
                                          : GFColors.LIGHT,
                                      fontSize: 30,
                                      fontFamily: "Calibre-Semibold",
                                      letterSpacing: 1.0),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_box,
                                    size: 12.0,
                                    color: darkMode
                                        ? GFColors.DARK
                                        : GFColors.LIGHT,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddSecretPage(
                                          darkmode: darkMode,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                          // List of categories
                          Categorylist(
                            darkMode: darkMode,
                          ),

                          // Secrets Card Carusel
                          SecretCardsCarousel(
                            darkMode: darkMode,
                          ),
                        ],
                      ),
                    ),
                  )

                // if not have data make a sync request to API and render the same logic, Add snackbar that provide message to the user for this process
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // SizedBox(
                        //   height: 15,
                        // ),
                        Container(
                          child: FutureBuilder(
                            future: secretsService.getSecrets('kalix'),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Secret>> snapshot) {
                              if (snapshot.hasData) {
                                secrets = snapshot.data;
                                Provider.of<SecretCardProvider>(context,
                                        listen: false)
                                    .addSecrets(secrets);
                                return SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "Secrets #${secrets.length}",
                                              style: TextStyle(
                                                  color: darkMode
                                                      ? GFColors.DARK
                                                      : GFColors.LIGHT,
                                                  fontSize: 30,
                                                  fontFamily:
                                                      "Calibre-Semibold",
                                                  letterSpacing: 1.0),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.add_box,
                                                size: 12.0,
                                                color: darkMode
                                                    ? GFColors.DARK
                                                    : GFColors.LIGHT,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      // List of categories
                                      Categorylist(
                                        darkMode: darkMode,
                                      ),
                                      SecretCardsCarousel(
                                        darkMode: darkMode,
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
