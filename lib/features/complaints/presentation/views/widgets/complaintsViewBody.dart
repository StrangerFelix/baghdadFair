import 'package:baghdad_fair/core/components/customButton.dart';
import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customTextField.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsBloc.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsEvents.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsStates.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsViewBody extends StatefulWidget {
  const ComplaintsViewBody({super.key});

  @override
  State<ComplaintsViewBody> createState() => _ComplaintsViewBodyState();
}

class _ComplaintsViewBodyState extends State<ComplaintsViewBody> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsBloc, ContactUsStates>(
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
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).help_message,
                      style: AppStyles.titleLarge
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hintText: S.of(context).name,
                      fillColor: Colors.white,
                      controller: nameController,
                      minLines: 1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'املئ الحقل';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      fillColor: Colors.white,
                        hintText: S.of(context).email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        minLines: 1,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'املئ الحقل';
                          }
                          return null;
                        }),
                    CustomTextField(
                        hintText: S.of(context).complaint_title,
                        fillColor: Colors.white,
                        controller: subjectController,
                        minLines: 1,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'املئ الحقل';
                          }
                          return null;
                        }),
                    CustomTextField(
                        hintText: S.of(context).message,
                        fillColor: Colors.white,
                        controller: messageController,
                        minLines: 1,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'املئ الحقل';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    state is! SendEmailLoading
                        ? CustomButton(
                            width: double.infinity,
                            vpadding: 10,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<ContactUsBloc>().add(
                                    SendEmailEvent(
                                        name: nameController.text,
                                        email: emailController.text,
                                        subject: subjectController.text,
                                        message: messageController.text));
                              }
                            },
                            text: S.of(context).send,
                          )
                        : const CustomLoadingIndicator()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
