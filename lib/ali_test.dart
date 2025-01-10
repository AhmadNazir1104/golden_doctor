import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'view_models/language_provider.dart';

class AliTest extends ConsumerWidget {
  const AliTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late InAppWebViewController webViewController;
    // final selectedLanguage = ref.watch(languageProvider);
    // final isRtl = selectedLanguage == Language.arabic ||
    //     selectedLanguage == Language.urdu;

    // String text = 'ALi';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Prime AI'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            // parameter required
            // Custumer Id
            // retailerid
            // product Handle Id
            'https://www.primeai2.org/CUSTOMERS/scrubsershop/mobilewidget/size_recommendation_native.php?retailerid=scrubsershop&customerid=7853285146857&productid=womens-zip-front-warm-up-solid-scrub&lang=ar'),
            // 'https://www.primeai2.org/aop/aop_get_cidfromret.php?par0=c2NydWJzZXJzaG9w&par1=Nzg1MzI4NTE0Njg1Nw=='),
            // 'https://www.primeai2.org/CUSTOMERS/scrubsershop/mobilewidget/pai_retailer_min.js'),
            // 'https://www.primeai2.org/CUSTOMERS/scrubsershop/mobilewidget/pai_retailer_min.js'),
            // ' https://www.primeai2.org/CUSTOMERS/scrubsershop/mobilewidget/002-use-widget.js',)
              // 'https://www.primeai2.org/CUSTOMERS/scrubsershop/mobilewidget/size_recommendation_native.php?retailerid=scrubsershop&customerid=7853285146857&productid=8810259284201'),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          print("Started loading: $url");
        },
        onLoadStop: (controller, url) async {
          print("Finished loading: $url");
        },
      ),

      //  Directionality(
      //   textDirection:  isRtl ? TextDirection.rtl : TextDirection.ltr,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      //     // crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text(selectedLanguage.toString()),
      //       SizedBox(width: MediaQuery.of(context).size.width,),
      //       Text("data"),
      //       Text(text),
      //       Text("qwe"),
      //       Text("data")
      //     ],
      //   ),
      // ),
    );
  }
}
