import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/views/components/participatingCompaniesItem.dart';
import 'package:flutter/material.dart';

class ParticipatingCompaniesList extends StatefulWidget {
  const ParticipatingCompaniesList({super.key});

  @override
  State<ParticipatingCompaniesList> createState() => _ParticipatingCompaniesListState();
}

class _ParticipatingCompaniesListState extends State<ParticipatingCompaniesList> {
  final limit = 10;
  int page = 1;
  final _controller = ScrollController();
  final itemCount = 3;
  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        // use the bloc event
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: _controller,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount + 1,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (index < itemCount) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5
            ),
            child: ParticipatingCompaniesItem(
              name: 'العتبة العباسية المقدسة',
              secondName: 'Al-Abbas Holy Shrine',
              email: "Info@alkafeel.net",
              phone: '07723953380',
              companyDirection: 'شركة داخلية',
              companyType: 'مؤسسة',
              location: "كربلاء/المركز",
              localOrNot: 'عراقية'
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child:  CustomLoadingIndicator()
        );
      },
    );
  }
}