import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class AboutUsContext extends StatelessWidget {
  const AboutUsContext({this.description,super.key});
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 30,left: horizontalPadding,right: horizontalPadding),
          decoration: AppStyles.primaryBoxDeocration(hasBorRadius: true).copyWith(
            border: Border.all(
              color: gradiant2.withOpacity(.4),
              width: 3, 
            )
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: gradiant2.withOpacity(.4),
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(17),
                        bottomStart: Radius.circular(17),
                      ),
                    ),
                    
                  ),
                ),
                Expanded(
                  flex: 14,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 25,
                      bottom: 25,
                      start: 10,
                      end: 25
                    ),
                    child: Text(
                      description ?? "",
                      textAlign: TextAlign.justify,
                      style: AppStyles.bodySmall.copyWith(height: 1.8),
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50,)
      ],
    );
  }
}