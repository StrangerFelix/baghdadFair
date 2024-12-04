import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

class ContactUsInfo extends StatelessWidget {
  const ContactUsInfo({required this.imageLink,required this.title,required this.description,super.key});
  final String imageLink;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: AssetImage(imageLink),
            ),
            const SizedBox(width: 5,),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start:10),
          child: Text(
            description,
            style: AppStyles.paragraphSmall,
          ),
        )
      ],
    );
  }
}