import 'package:baghdad_fair/core/components/customDrawerButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/main/data/models/drawerModel.dart';
import 'package:baghdad_fair/features/main/presentation/views/widgets/drawer/languageButtons.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

void openDrawer(BuildContext context,double topPadding) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: topPadding),
              SizedBox(
                height:  50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35,bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          S.of(context).lists,
                          style: AppStyles.title18,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close)
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: primaryBackgroundColor,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: drawerButtons(context).length,
                  itemBuilder: (context, index) {
                    if (index == drawerButtons(context).length - 1) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomDrawerButton(
                            title: drawerButtons(context)[index].title,
                            icon: drawerButtons(context)[index].icon,
                            onTap: drawerButtons(context)[index].onTap,
                          ),
                          CustomDrawerButton(
                            title: S.of(context).changeLanguageButton,
                            icon: AppAssets.langs,
                          ),
                          const LanguageButtons()
                        ],
                      );
                    }
                    return CustomDrawerButton(
                      title: drawerButtons(context)[index].title,
                      icon: drawerButtons(context)[index].icon,
                      onTap: drawerButtons(context)[index].onTap,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }