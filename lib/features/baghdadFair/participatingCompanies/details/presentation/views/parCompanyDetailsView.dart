import 'package:baghdad_fair/core/components/screenAppBar.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/details/presentation/views/widgets/parCompanyDetailsBody.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/participatingCompanies/data/models/companiesModel.dart';
import 'package:flutter/material.dart';

class ParticipatingCompanyDetailsView extends StatelessWidget {
  const ParticipatingCompanyDetailsView({required this.company,super.key});
  final Company company;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screenAppBar,
      body: ParticipatingCompanyDetailsBody(company: company,),
    );
  }
}