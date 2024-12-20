import 'package:baghdad_fair/core/components/screenAppBar.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/utilities/serviceLocator.dart';
import 'package:baghdad_fair/features/complaints/presentation/views/widgets/complaintsViewBody.dart';
import 'package:baghdad_fair/features/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/home/presentation/manager/contactUs/contactUsBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        appBar: screenAppBar,
        body: const ComplaintsViewBody(),
      ),
    );
  }
}