import 'package:flutter/material.dart';

class SingleBannerWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  const SingleBannerWidget(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}
