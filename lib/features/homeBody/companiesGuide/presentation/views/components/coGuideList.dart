import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/coGuideItem.dart';
import 'package:flutter/material.dart';

class CompaniesGuideList extends StatefulWidget {
  const CompaniesGuideList({super.key});

  @override
  State<CompaniesGuideList> createState() => _CompaniesGuideListState();
}

class _CompaniesGuideListState extends State<CompaniesGuideList> {
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
      padding: const EdgeInsets.only(top: 10),
      controller: _controller,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount + 1,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (index < itemCount) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 5
            ),
            child: CompaniesGuideItem(
              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY70aj8rN_VdbZpVuwtQx7I9dj4JCWQS4w2g&s',
              title: 'مكتب القيقب العلمي',
              city: 'بغداد',
              date: '2024/4/20',
              category: 'تجارة سلع مصنعة اخرى',
              phone: '0832743284',
              email: 'tariq-alhujud@EI.IQ',
              publicOrPrivate: 'خاص',
              views: '6',
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