import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/urlLauncher.dart';
import 'package:baghdad_fair/features/homeBody/home/data/models/mapsModels.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mapButton.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainMaps extends StatelessWidget {
  const MainMaps({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              S.of(context).our_location,
              style: AppStyles.title18,
            ),
          ),
          const SizedBox(height: 10,),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: maps(context).length,
            itemBuilder: (context,index) {
              return MapButton(
                text: maps(context)[index].name,
                onTap: () async{
                  await launchURL(maps(context)[index].url);
                },
              );
            }
          ),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}