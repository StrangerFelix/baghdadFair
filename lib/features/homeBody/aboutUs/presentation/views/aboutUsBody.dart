import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/data/models/aboutUsModel.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsStates.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsBloc.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/views/components/aboutUsContext.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({super.key});

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  AboutUs? aboutUs;
  String? error;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsStates>(
      builder: (context, state) {
        if (state is AboutUsLoaded) {
          aboutUs = state.model.data!.response![0];
        }
        if (state is AboutUsFailure) {
          error = state.error;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SectionTitle(
              title: S.of(context).fair_history,
            ),
            state is! AboutUsLoading ? 
            state is! AboutUsFailure ? 
            state is AboutUsLoaded ?
            AboutUsContext(
              description: aboutUs != null ? aboutUs!.description : S.of(context).error,
            )
            : const SizedBox()
            : CustomErrorWidget(error: error,) 
            : const CustomLoadingWidget()
          ],
        );
      },
    );
  }
}
