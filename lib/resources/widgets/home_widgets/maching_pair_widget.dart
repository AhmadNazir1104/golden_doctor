import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/models/home_model/home_model.dart';

// ignore: must_be_immutable
class MachingPairWidgetWidget extends StatelessWidget {
  Section section;
  // final String image;
  // final double height;
  // final VoidCallback voidCallback;

  MachingPairWidgetWidget({
    super.key,
    required this.section,
    // required this.image,
    // required this.height,
    // required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/setBuilderScreen');
      },
      child: Container(
        height: double.parse(section.height.toString()),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 36.h),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(section.desktopImg.toString())
              // AssetImage(
              //   image,
              // ),
              ),
        ),
      ),
    );
  }
}
