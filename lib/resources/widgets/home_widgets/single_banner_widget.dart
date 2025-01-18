import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/models/home_model/home_model.dart';

// ignore: must_be_immutable
class SingleBannerWidget extends StatelessWidget {
  Section section;
  // final String image;
  // final double height;
  // final double width;
  SingleBannerWidget({
    super.key,
    required this.section,
    // required this.image,
    // required this.height,
    // required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/collectionScreen');
        // if (singleCategory.objType!.name == 'COLLECTIONS') {
        //   log('collections========');
        //   context.push('/collectionScreen');
        // } else if (singleCategory.objType!.name == 'product') {
        //   log('product========');
        // } else {
        //   log('other========');
        //   log('Obg type ==== ${singleCategory.objType!.name}');
        // }
      },
      child: Container(
        height: double.parse(section.body![0].height.toString()),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                section.body![0].previewImage.toString(),
              )
              //     AssetImage(
              //   AppImages.singleBanner,
              // ),
              ),
        ),
      ),
    );
  }
}
