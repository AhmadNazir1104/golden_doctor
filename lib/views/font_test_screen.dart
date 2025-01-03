import 'package:flutter/material.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
// import 'app_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen', style: AppTextStyles.headline1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('App Font Family === ${AppTextStyles.fontFamily}'),
            SizedBox(height: 8),
            Text('Headline 1 Example', style: AppTextStyles.headline1),
            SizedBox(height: 8),
            Text('Headline 2 Example', style: AppTextStyles.headline2),
            SizedBox(height: 8),
            Text('Body 1 Example', style: AppTextStyles.body1),
            SizedBox(height: 8),
            Text('Body 2 Example', style: AppTextStyles.body2),
            SizedBox(height: 8),
            Text('Body 3 Example', style: AppTextStyles.body3),
          ],
        ),
      ),
    );
  }
}
