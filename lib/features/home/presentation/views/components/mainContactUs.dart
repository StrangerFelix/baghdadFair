import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customTextField.dart';
import 'package:baghdad_fair/core/components/customButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/utilities/serviceLocator.dart';
import 'package:baghdad_fair/features/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsBloc.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsEvents.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsStates.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/mainContactUsItem.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainContactUs extends StatefulWidget {
  const MainContactUs({this.addressInfo, this.phoneInfo, super.key});
  final String? addressInfo;
  final String? phoneInfo;

  @override
  State<MainContactUs> createState() => _MainContactUsState();
}

class _MainContactUsState extends State<MainContactUs> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsBloc(
        getIt.get<HomeRepositoryImplementation>()
      ),
      child: BlocConsumer<ContactUsBloc, ContactUsStates>(
        listener: (context, state) {
          if (state is SendEmailSuccess) {
            FocusScope.of(context).unfocus();
            nameController.clear();
            emailController.clear();
            subjectController.clear();
            messageController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          if (state is SendEmailFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).contact_us_error),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width < 600 
                        ? MediaQuery.of(context).size.width * .8 : 480,
                      
                      decoration: AppStyles.primaryBoxDeocration(borderRadius: 2),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 15,
                          right: 15,
                          bottom: 10
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: ContactUsInfo(
                                    imageLink: AppAssets.location,
                                    title: S.of(context).our_address,
                                    description: widget.addressInfo ?? "",
                                  ),
                                ),
                                Expanded(
                                  child: ContactUsInfo(
                                    imageLink: AppAssets.call,
                                    title: S.of(context).call_us,
                                    description: widget.phoneInfo ?? "",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    hintText: S.of(context).name,
                                    controller: nameController,
                                    height: null,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'املئ الحقل';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                      hintText: S.of(context).email,
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      height: null,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'املئ الحقل';
                                        }
                                        return null;
                                      }),
                                  CustomTextField(
                                      hintText: S.of(context).subject,
                                      controller: subjectController,
                                      height: null,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'املئ الحقل';
                                        }
                                        return null;
                                      }),
                                  CustomTextField(
                                      hintText: S.of(context).message,
                                      controller: messageController,
                                      minLines: 1,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'املئ الحقل';
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: state is! SendEmailLoading
                                    ? CustomButton(
                                        vpadding: 5,
                                        width: 150,
                                        otherChild: Row(
                                          children: [
                                            const SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                SvgPicture.asset(
                                                  AppAssets.send,
                                                  width: 18,
                                                  height: 18
                                                ),
                                                const SizedBox(height: 2,)
                                              ],
                                            )
                                          ],
                                        ),
                                        onPressed: () {
                                          if (formKey.currentState!.validate()) {
                                            context.read<ContactUsBloc>().add(
                                              SendEmailEvent(
                                                  name: nameController.text,
                                                  email:
                                                      emailController.text,
                                                  subject: subjectController
                                                      .text,
                                                  message: messageController
                                                      .text));
                                          }
                                          
                                        },
                                        text: S.of(context).send,
                                      )
                                    : const CustomLoadingIndicator(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width < 600 
                        ? MediaQuery.of(context).size.width * .6 : 360,
                    height: 40,
                    decoration: BoxDecoration(
                        color: gradiant2,
                        borderRadius: BorderRadius.circular(2)),
                    child: Center(
                      child: Text(
                        S.of(context).contact_us,
                        style: AppStyles.bodySmall.copyWith(color: Colors.white,fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 420),
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
                      height: 380,
                      decoration:
                          AppStyles.primaryBoxDeocration(borderRadius: 2),
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: ContactUsInfo(
                                        imageLink: AppAssets.location,
                                        title: S.of(context).our_address,
                                        description: widget.addressInfo ?? "",
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: ContactUsInfo(
                                        imageLink: AppAssets.phone,
                                        title: S.of(context).call_us,
                                        description: widget.phoneInfo ?? "",
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Form(
                            key: formKey,
                            child: Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    hintText: S.of(context).name,
                                    controller: nameController,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'املئ الحقل';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                      hintText: S.of(context).email,
                                      controller: emailController,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'املئ الحقل';
                                        }
                                        return null;
                                      }),
                                  CustomTextField(
                                      hintText: S.of(context).subject,
                                      controller: subjectController,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'املئ الحقل';
                                        }
                                        return null;
                                      }),
                                  CustomTextField(
                                      hintText: S.of(context).message,
                                      controller: messageController,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'املئ الحقل';
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: 
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          );
 */
/*

*/