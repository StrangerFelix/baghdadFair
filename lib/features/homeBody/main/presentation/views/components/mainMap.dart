import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainMap extends StatelessWidget {
  const MainMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15,),
        Text(
          S.of(context).our_location,
          style: AppStyles.title18,
        ),
        const SizedBox(height: 5,),
        const ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image(
            height: 200,
            fit: BoxFit.cover,
            image: AssetImage("assets/images/tempmap.png"),
          ),
        )
      ],
    );
  }
}