import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

class CountriesItem extends StatelessWidget {
  const CountriesItem({super.key, this.countryName, this.countryFlag});
  final String? countryName;
  final String? countryFlag;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Container(
        height: 130,
        decoration: AppStyles.primaryBoxDeocration(hasBorRadius: false),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  countryName ?? "",
                  maxLines: 1,
                  style: AppStyles.bodySmall,
                ),
              )
            ),
            Expanded(
              flex: 8,
              child: CustomCachedImage(countryFlag)
            ),
          ],
        ),
      ),
    );
  }
}