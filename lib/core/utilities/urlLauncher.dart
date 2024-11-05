import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String myUrl) async {
    final Uri url = Uri.parse(myUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $myUrl';
    }
  }