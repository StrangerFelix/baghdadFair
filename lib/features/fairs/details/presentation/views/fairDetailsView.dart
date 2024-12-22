import 'package:baghdad_fair/core/components/screenAppBar.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/fairs/details/presentation/views/widgets/fairDetailsBody.dart';
import 'package:baghdad_fair/features/fairs/fairs/data/models/fairsModel.dart';
import 'package:flutter/material.dart';

class FairDetailsScreen extends StatelessWidget {
  const FairDetailsScreen({required this.fair,super.key});
  final Fair fair;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: screenAppBar,
      body: FairDetailsBody(fair: fair,),
    );
  }
}