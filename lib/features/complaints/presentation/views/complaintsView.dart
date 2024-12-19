import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/utilities/serviceLocator.dart';
import 'package:baghdad_fair/features/complaints/presentation/views/widgets/complaintsViewBody.dart';
import 'package:baghdad_fair/features/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


class ComplaintsView extends StatelessWidget {
  const ComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsBloc(
        getIt.get<HomeRepositoryImplementation>()
      ),
      child: Scaffold(
        backgroundColor: primaryBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 2.5,
                ),
                child: SvgPicture.asset(
                  AppAssets.bflogo,
                  width: 40,
                ),
              ),
              const SizedBox(width: 10,),
              SvgPicture.asset(
                AppAssets.titleText,
                height: 45,
              ),
            ],
          ),
        ),
        body: const ComplaintsViewBody(),
      ),
    );
  }
}