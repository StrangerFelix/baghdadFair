import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/features/homeBody/ads/presentation/views/components/adsItem.dart';
import 'package:flutter/material.dart';

class AdsList extends StatefulWidget {
  const AdsList({super.key});

  @override
  State<AdsList> createState() => _AdsListState();
}

class _AdsListState extends State<AdsList> {
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
            child: AdsItem(
              image: Image(
                image: AssetImage(AppAssets.appImage),
                fit: BoxFit.contain,
              )
              
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