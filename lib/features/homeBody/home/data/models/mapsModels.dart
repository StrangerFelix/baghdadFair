import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MapsModel {
  final String name;
  final String url;
  MapsModel({required this.name, required this.url});
}
List <MapsModel> maps(BuildContext context) {
  return [
    MapsModel(
      name: S.of(context).title, 
      url: "https://maps.app.goo.gl/nNcFsvUJTrtNTwmH8"
    ),
    MapsModel(
      name: S.of(context).babil_fair, 
      url: "https://maps.app.goo.gl/GNRzayhxUaNgTw656"
    ),
    MapsModel(
      name: S.of(context).sorouh_fair, 
      url: "https://maps.app.goo.gl/dZ6LfUKVkYqjbtWK7"
    ),
    MapsModel(
      name: S.of(context).hallvip, 
      url: "https://maps.app.goo.gl/TfGkWAFuU7YvjwDk8"
    ),
  ];
}