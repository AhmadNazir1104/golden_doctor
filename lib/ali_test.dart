import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view_models/language_provider.dart';

 class AliTest  extends ConsumerWidget {
  const AliTest({super.key});




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);
    // final languageText = getLanguageText(selectedLanguage);

    // Check if the selected language is right-to-left
    final isRtl = selectedLanguage == Language.arabic ||
        selectedLanguage == Language.urdu;
    
    String text = 'ALi';
    
    
    
    return Scaffold(
      body: Directionality(
        textDirection:  isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(selectedLanguage.toString()),
            SizedBox(width: MediaQuery.of(context).size.width,),
            Text("data"),
            Text(text),
            Text("qwe"),
            Text("data")
          ],
        ),
      ),
    );
  }
}
