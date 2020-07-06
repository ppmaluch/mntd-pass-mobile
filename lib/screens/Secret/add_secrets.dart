import 'package:flutter/material.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:mntd_mobile/providers/SecretCardProvider.dart';
import 'package:mntd_mobile/utils/constants.dart';
import 'package:mntd_mobile/utils/themes/colors.dart';
import 'package:provider/provider.dart';

class AddSecretPage extends StatefulWidget {
  final bool darkmode;
  AddSecretPage({Key key, this.darkmode}) : super(key: key);

  @override
  _AddSecretPageState createState() => _AddSecretPageState();
}

class _AddSecretPageState extends State<AddSecretPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController valueController = new TextEditingController();
  TextEditingController categoryController = new TextEditingController();
  void addSecret() {
    Secret newSecret = Secret(
      username: USER_TEST,
      name: nameController.text,
      value: valueController.text,
      createdAt: null,
      category: categoryController.text,
      img: null,
    );
    Provider.of<SecretCardProvider>(context, listen: false)
        .addSecret(newSecret);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      backgroundColor: widget.darkmode ? GFColors.LIGHT : GFColors.DARK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Secret",
          style: TextStyle(
              color: widget.darkmode ? GFColors.DARK : GFColors.LIGHT),
        ),
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: widget.darkmode ? GFColors.DARK : GFColors.LIGHT,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: widget.darkmode ? GFColors.DARK : GFColors.LIGHT,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: nameController,
                    style: TextStyle(
                      color: widget.darkmode ? GFColors.LIGHT : GFColors.DARK,
                      fontWeight: FontWeight.bold,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusColor: GFColors.FOCUS,
                      border: InputBorder.none,
                      hintText: 'Secret name',
                      hintStyle: TextStyle(
                        color: widget.darkmode
                            ? GFColors.LIGHT
                            : GFColors.kPrimary400Color,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: widget.darkmode ? GFColors.DARK : GFColors.LIGHT,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: valueController,
                    style: TextStyle(
                      color: widget.darkmode ? GFColors.LIGHT : GFColors.DARK,
                      fontWeight: FontWeight.bold,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Secret value',
                      hintStyle: TextStyle(
                        color: widget.darkmode
                            ? GFColors.LIGHT
                            : GFColors.kPrimary400Color,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: widget.darkmode ? GFColors.DARK : GFColors.LIGHT,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: categoryController,
                    style: TextStyle(
                      color: widget.darkmode ? GFColors.LIGHT : GFColors.DARK,
                      fontWeight: FontWeight.bold,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Secret category',
                      hintStyle: TextStyle(
                        color: widget.darkmode
                            ? GFColors.LIGHT
                            : GFColors.kPrimary400Color,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () => addSecret(),
                  elevation: 0,
                  minWidth: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
