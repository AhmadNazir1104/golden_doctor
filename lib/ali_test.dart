// import 'package:flutter/material.dart';

// class AnimatedDashboard extends StatefulWidget {
//   const AnimatedDashboard({super.key});

//   @override
//   _AnimatedDashboardState createState() => _AnimatedDashboardState();
// }

// class _AnimatedDashboardState extends State<AnimatedDashboard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _headerAnimation;
//   late Animation<Offset> _buttonsAnimation;
//   late Animation<Offset> _chartAnimation;
//   late Animation<Offset> _tableAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the AnimationController
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     // Define animations for different sections
//     _headerAnimation = Tween<Offset>(
//       begin: Offset(0, -1), // Start from the top
//       end: Offset.zero, // End at original position
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     _buttonsAnimation = Tween<Offset>(
//       begin: Offset(-1, 0), // Start from the left
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     _chartAnimation = Tween<Offset>(
//       begin: Offset(0, 1), // Start from the bottom
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     _tableAnimation = Tween<Offset>(
//       begin: Offset(1, 0), // Start from the right
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     // Start animations
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Header Animation
//           SlideTransition(
//             position: _headerAnimation,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Welcome, Muhammad.',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),

//           // Buttons Animation
//           SlideTransition(
//             position: _buttonsAnimation,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   onPressed: () {},
//                   child: Text('Previous Clients'),
//                 ),
//                 ElevatedButton(
//                   style:
//                       ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
//                   onPressed: () {},
//                   child: Text('Add New Client'),
//                 ),
//               ],
//             ),
//           ),

//           // Chart Animation
//           Expanded(
//             child: SlideTransition(
//               position: _chartAnimation,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Placeholder(
//                       fallbackHeight: 150, // Replace with your PieChart widget
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Total Orders: 20',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Table Animation
//           SlideTransition(
//             position: _tableAnimation,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Order Details Table Goes Here',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),

//           // Bottom Button
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//               onPressed: () {},
//               child: Text('View Order'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




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
