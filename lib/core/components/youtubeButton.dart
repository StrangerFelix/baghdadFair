import 'package:baghdad_fair/core/components/custumButton.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubeButton extends StatelessWidget {
  final String youtubeUrl;

  const YouTubeButton({super.key, required this.youtubeUrl});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(youtubeUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $youtubeUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: _launchURL, 
      text: S.of(context).show_video,
      color: Colors.grey[200],
      textStyle: AppStyles.bodySmall.copyWith(fontSize: 14),
      vpadding: 5,
      hpadding: 15,
    );
  }
}