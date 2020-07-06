import 'package:flutter/material.dart';
import 'package:mntd_mobile/models/secret_model.dart';
import 'package:jiffy/jiffy.dart' as jiffy;

import 'customIcons.dart';

const kDefaultPadding = 20.0;
const kCardAspectRatio = 12.0 / 16.0;
const kWidgetAspectRatio = kCardAspectRatio * 1.2;
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);
// API_URL services

// const BASE_URL = 'http://169.254.236.166:8082'; //local URL
//const BASE_URL = 'https://kenri-mntd-pass-api.herokuapp.com'; //remote URL
const BASE_URL = 'http://192.168.43.119:8080';
// "mario", "msda930313@17"
const USER_TEST = 'kalix';
const PASS_TEST = 'kalix';

String getTimeStamp(Secret secret) {
  var jiffy1 = jiffy.Jiffy(secret.createdAt);
  var jiffy2 = jiffy.Jiffy(DateTime.now().toIso8601String());
  return secret.createdAt == null ? jiffy2.fromNow() : jiffy1.fromNow();
}

String getImagenByCategory(String category) {
  return categoryItems[category];
}
