import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const primaryBackgroundColor = Color(0xffeaf5ff);
const primaryTextColor = Color(0xff016AC5);
const horizontalPadding = 22.0;
const splashEndingNavigationDuration = Duration(milliseconds: 700);
const navigationDuration = Duration(milliseconds: 350);
const activeColor = Color(0xFF828282);

String apiKey = dotenv.env['API_KEY'] ?? '';