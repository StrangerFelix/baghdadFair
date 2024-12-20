import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            Column(
              children: [
                SvgPicture.asset(
                  imageLink,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(height: 2,)
              ],
            ),
            const SizedBox(width: 10,),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: gradiant2.withOpacity(.75)
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
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