import 'package:baghdad_fair/core/components/customTextField.dart';
import 'package:baghdad_fair/core/components/custumButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainContactUsItem.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainContactUs extends StatelessWidget {
  const MainContactUs({
    this.addressInfo,
    this.phoneInfo,
    super.key
  });
  final String? addressInfo;
  final String? phoneInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 400
        ),
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 22,
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                    start: 25,
                    end: 25,
                    top: 25,
                    // bottom: 15
                  ),
                  width: 320,
                  height: 360,
                  decoration: AppStyles.primaryBoxDeocration(
                    borderRadius: 2
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ContactUsInfo(
                                imageLink: AppAssets.location,
                                title: S.of(context).our_address,
                                description: addressInfo ?? "",
                              )
                            ),
                            Expanded(
                              flex: 2,
                              child: ContactUsInfo(
                                imageLink: AppAssets.phone, 
                                title: S.of(context).call_us,
                                description: phoneInfo ?? "",
                              )
                            ),
                          ],
                        ),
                      ),
                      CustomTextField(hintText: S.of(context).email),
                      CustomTextField(hintText: S.of(context).address_of_complaint),
                      CustomTextField(hintText: S.of(context).inquiry),
                      CustomTextField(hintText: S.of(context).your_message),
                      const SizedBox(height: 10,),
                       Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: CustomButton(
                          onPressed: () {
                            
                          }, 
                          text: S.of(context).send,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: 220,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3EA9F9),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).contact_us,
                      style: AppStyles.gradientBoxTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}