import 'package:baghdad_fair/core/components/customHomeButton.dart';
import 'package:flutter/material.dart';

class MainHomeInfoItem extends StatelessWidget {
  const MainHomeInfoItem({
    required this.imageLink,
    required this.titleName,
    required this.title
    ,super.key
  });
  final String imageLink;
  final String titleName; 
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomHomeButton(
            child: Image(
              image: AssetImage(imageLink)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              titleName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}