import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/ali_test.dart';
import 'package:golden_doctor/graph_ql/config.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_routes.dart';
import 'package:golden_doctor/utils/app_theme.dart';
import 'package:golden_doctor/view_models/language_provider.dart';
import 'package:golden_doctor/views/splash_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ShearedprefService.initialize();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyB5aW_fZYEmDdAbGB0HKw9o6ZaMPZMK-Pw',
    appId: '1:879855623897:android:20c3cfbeb5bbb98581e8c8',
    messagingSenderId: 'messagingSenderId',
    projectId: 'golden-doctors',
    storageBucket: "golden-doctors.firebasestorage.app",
  ));
  // await HiveService.hiveinitialize();
  // // await TodoSaverService.init();
  // await Firebase.initializeApp();
  // await Upgrader.clearSavedSettings(); // REMOVE this for release builds
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final graphqlconnection = GraphQlHelper();

    return     ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GraphQLProvider(
          client: graphqlconnection.client,
          child: MaterialApp.router(
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
            title: AppConstant.appName,
            theme: myTheme(context),
            // builder: (context, child) {
            //   return UpgradeAlert(
            //     navigatorKey: appRouter.routerDelegate.navigatorKey,
            //     upgrader: Upgrader(

            //         // debugDisplayAlways: true,
            //         // minAppVersion: "[Minimum supported app version: 1.2.3]",
            //         ),
            //     child: child ??
            //         Scaffold(
            //             body: Center(
            //                 child: Text(
            //           "upgrade...",
            //           style: AppTextStyles.largeHeading,
            //         ))),
            //   );
            // },
          ),
        );
      },
    );
 
    
    
    
    // MaterialApp(
    //   home:
    //       // SplashScreen()
    //       Scaffold(
    //     appBar: AppBar(
    //       title: const Text('ahmad'),
    //       actions: [
    //         PopupMenuButton<Language>(
    //           icon: const Icon(Icons.language),
    //           onSelected: (Language language) =>
    //               ref.read(languageProvider.notifier).state = language,
    //           itemBuilder: (context) => [
    //             const PopupMenuItem(
    //                 value: Language.english, child: Text('English')),
    //             const PopupMenuItem(
    //                 value: Language.arabic, child: Text('Arabic')),
    //             const PopupMenuItem(
    //                 value: Language.italian, child: Text('Italian')),
    //             const PopupMenuItem(
    //                 value: Language.hindi, child: Text('Hindi')),
    //             const PopupMenuItem(value: Language.urdu, child: Text('Urdu')),
    //           ],
    //         ),
    //       ],
    //     ),
    //     body: const Padding(
    //       padding: EdgeInsets.all(16.0),
    //       child: LanguageForm(),
    //       // child: SplashScreen(),
    //     ),
    //   ),
    // );
 
  }
}

class LanguageForm extends ConsumerWidget {
  const LanguageForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);
    final languageText = getLanguageText(selectedLanguage);

    // Check if the selected language is right-to-left
    final isRtl = selectedLanguage == Language.arabic ||
        selectedLanguage == Language.urdu;
    // Sample dynamic data for the ListView.builder
    final items = [
      {'textOne': languageText['textOne'], 'textTwo': languageText['textTwo']},
      {
        'textOne': languageText['enterText'],
        'textTwo': languageText['enterName']
      },
      {'textOne': 'Row 3 Text 1', 'textTwo': 'Row 3 Text 2'},
    ];

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        children: [
          TestWidget(), TestWidget(), TestWidget(),

          // Dynamic ListView.builder with scroll direction
          SizedBox(
            height: 100, // Set appropriate height for horizontal ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // reverse: isRtl, // Reverse for RTL languages
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment:
                        isRtl ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Text(
                        item['textOne']!,
                        textAlign: isRtl ? TextAlign.right : TextAlign.left,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item['textTwo']!,
                        textAlign: isRtl ? TextAlign.right : TextAlign.left,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // Row with two Text widgets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                languageText['textOne']!,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                languageText['textTwo']!,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                languageText['textOne3']!,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                languageText['textTwo4']!,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          TextFormField(
            textAlign: isRtl ? TextAlign.right : TextAlign.left,
            decoration: InputDecoration(
              hintText: languageText['enterText'],
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            textAlign: isRtl ? TextAlign.right : TextAlign.left,
            decoration: InputDecoration(
              hintText: languageText['enterName'],
            ),
          ),

          const SizedBox(height: 20),
          InkWell(
              onTap: () {
                print('axfcgvhbjnkjl;lkjhgfxghjkl;kjhgfhjkl;');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ));
              },
              child: Container(
                child: const Text('Next Screen'),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AliTest()));
              },
              child: Text("move")),
        ],
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'textOne',
          // textAlign: isRtl ? TextAlign.right : TextAlign.left,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'textTwo',
          // textAlign: isRtl ? TextAlign.right : TextAlign.left,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'textOne3',
          // textAlign: isRtl ? TextAlign.right : TextAlign.left,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'textTwo4',
          // textAlign: isRtl ? TextAlign.right : TextAlign.left,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
