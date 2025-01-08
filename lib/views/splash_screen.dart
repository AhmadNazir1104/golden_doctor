import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/models/language/language_model.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/view_models/fonts_view_model.dart';
import 'package:golden_doctor/views/font_test_screen.dart';

LanguageModel? selectedLanguage;

FontWeight fontWeightFromInt(int weight) {
  switch (weight) {
    case 100:
      return FontWeight.w100;
    case 200:
      return FontWeight.w200;
    case 300:
      return FontWeight.w300;
    case 400:
      return FontWeight.w400;
    case 500:
      return FontWeight.w500;
    case 600:
      return FontWeight.w600;
    case 700:
      return FontWeight.w700;
    case 800:
      return FontWeight.w800;
    case 900:
      return FontWeight.w900;
    default:
      throw ArgumentError(
          "Invalid weight value: $weight. Must be 100, 200, ..., 900.");
  }
}

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    print('fontSettingsAsync');
    final fontSettingsAsync = ref.watch(fontSettingsProvider);
    print('getLanguageAsync');
    final getLanguageAsync = ref.watch(getLanguageProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getLanguageAsync.when(
            data: (languages) {
              return DropdownButton<LanguageModel>(
                value: selectedLanguage,
                hint: Text("Select a Language"),
                items: languages.map((language) {
                  return DropdownMenuItem<LanguageModel>(
                    value: language,
                    child: Row(
                      children: [
                        Image.network(
                          language.iconSrc,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Text(language.title),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (LanguageModel? newLanguage) {
                  setState(() {
                    selectedLanguage = newLanguage;
                  });
                  print('Selected Language: ${newLanguage?.title}');
                },
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
          ),

          // fontSettingsAsync.when(
          //   data: (fontSettings) {
          //     // Navigate to home screen once data is loaded
          //     AppTextStyles.updateFontStyles(
          //       family: fontSettings.fontFamily,
          //       // h1Size: double.parse(fontSettings.headline1Size.toString()),
          //       // h2Size: double.parse(fontSettings.headline2Size.toString()),
          //       // b1Size: double.parse(fontSettings.body1Size.toString()),
          //       // b2Size: double.parse(fontSettings.body2Size.toString()),
          //       // b3Size: double.parse(fontSettings.body3Size.toString()),
          //       // h1Weight: fontWeightFromInt(fontSettings.headline1Weight),
          //       // h2Weight: fontWeightFromInt(fontSettings.headline2Weight),
          //       // b1Weight: fontWeightFromInt(fontSettings.body1Weight),
          //       // b2Weight: fontWeightFromInt(fontSettings.body2Weight),
          //       // b3Weight: fontWeightFromInt(fontSettings.body3Weight),
          //     );
          //     Future.microtask(() => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const MainScreen(),
          //         )));
          //     return Container(
          //       color: AppColors.black2022,
          //     );
          //   },
          //   loading: () => const Center(child: CircularProgressIndicator()),
          //   error: (error, stack) {
          //     print("Error: $error");
          //     print("Stack trace: $stack");
          //     return const Center(child: Text('Error loading font settings'));
          //   },
          // ),
        ],
      ),
    );
  }
}

// class SplashScreen extends ConsumerWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('fontSettingsAsync');
//     final fontSettingsAsync = ref.watch(fontSettingsProvider);
//     print('getLanguageAsync');
//     final getLanguageAsync = ref.watch(getLanguageProvider);
//     return Scaffold(
//       body: Column(
//         children: [
// getLanguageAsync.when(
//       data: (languages) {
//         return DropdownButton<LanguageModel>(
//           value: selectedLanguage,
//           hint: Text("Select a Language"),
//           items: languages.map((language) {
//             return DropdownMenuItem<LanguageModel>(
//               value: language,
//               child: Row(
//                 children: [
//                   Image.network(
//                     language.iconSrc,
//                     width: 24,
//                     height: 24,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(width: 10),
//                   Text(language.title),
//                 ],
//               ),
//             );
//           }).toList(),
//           onChanged: (LanguageModel? newLanguage) {
//             setState(() {
//               selectedLanguage = newLanguage;
//             });
//             print('Selected Language: ${newLanguage?.title}');
//           },
//         );
//       },
//       loading: () => CircularProgressIndicator(),
//       error: (err, stack) => Text('Error: $err'),
//     ),

//           fontSettingsAsync.when(
//             data: (fontSettings) {
//               // Navigate to home screen once data is loaded
//               AppTextStyles.updateFontStyles(
//                 family: fontSettings.fontFamily,
//                 // h1Size: double.parse(fontSettings.headline1Size.toString()),
//                 // h2Size: double.parse(fontSettings.headline2Size.toString()),
//                 // b1Size: double.parse(fontSettings.body1Size.toString()),
//                 // b2Size: double.parse(fontSettings.body2Size.toString()),
//                 // b3Size: double.parse(fontSettings.body3Size.toString()),
//                 // h1Weight: fontWeightFromInt(fontSettings.headline1Weight),
//                 // h2Weight: fontWeightFromInt(fontSettings.headline2Weight),
//                 // b1Weight: fontWeightFromInt(fontSettings.body1Weight),
//                 // b2Weight: fontWeightFromInt(fontSettings.body2Weight),
//                 // b3Weight: fontWeightFromInt(fontSettings.body3Weight),
//               );
//               Future.microtask(() => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const MainScreen(),
//                   )));
//               return null;
//             },
//             loading: () => const Center(child: CircularProgressIndicator()),
//             error: (error, stack) {
//               print("Error: $error");
//               print("Stack trace: $stack");
//               return const Center(child: Text('Error loading font settings'));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
