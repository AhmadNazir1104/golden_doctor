
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/views/home_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const SplashScreen(),
    // ),
     GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // GoRoute(
    //   path: '/loginScreen',
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: '/signupScreen',
    //   builder: (context, state) => const SignupScreen(),
    // ),
    // GoRoute(
    //   path: '/introScreen',
    //   builder: (context, state) => const IntroScreen(),
    // ),
    // GoRoute(
    //   path: '/nav_barScreen',
    //   builder: (context, state) => const MyBottomBar(),
    // ),
    // GoRoute(
    //   path: '/profile_screen',
    //   builder: (context, state) => const ProfileScreen(),
    // ),
    // GoRoute(
    //   path: '/wishlist_screen',
    //   builder: (context, state) => const WishListScreen(),
    // ),
    // GoRoute(
    //   path: '/cart_screen',
    //   builder: (context, state) {
    //     Map<String, dynamic> params = state.extra as Map<String, dynamic>;
    //     return CartScreen(
    //       canPop: params["canPop"],
    //     );
    //   },
    // ),
    // GoRoute(
    //     path: '/product_detail_screen',
    //     builder: (context, state) {
    //       // print(state.extra);
    //       Map<String, dynamic> params = state.extra as Map<String, dynamic>;
    //       return ProductDetailScreen(purpleNode: params["purpleNode"]);
    //     }),
    // GoRoute(
    //     path: '/online_product_detail_screen',
    //     builder: (context, state) {
    //       // print(state.extra);
    //       Map<String, dynamic> params = state.extra as Map<String, dynamic>;
    //       return OnlineProductDetails(productID: params["productID"]);
    //     }),
    // GoRoute(
    //   path: '/forget_password_screen',
    //   builder: (context, state) => const ForgetPasswordScreen(),
    // ),
    // GoRoute(
    //   path: '/collections_screen',
    //   builder: (context, state) => const CollectionsScreen(),
    // ),
    // GoRoute(
    //   path: '/collection_product_screen',
    //   builder: (context, state) {
    //     Map<String, dynamic> param = state.extra as Map<String, dynamic>;
    //     return CollectionProductsScreen(
    //       collectionId: param["collectionID"],
    //       collectionName: param["collectionName"],
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: '/checkout_webview_screen',
    //   builder: (context, state) {
    //     Map<String, dynamic> checkoutURL = state.extra as Map<String, dynamic>;
    //     return WebViewCheckout(
    //       weburl: checkoutURL["checkouturl"],
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: '/allOrder_screen',
    //   builder: (context, state) => const AllOrdersScreen(),
    // ),
    // GoRoute(
    //   path: '/search_screen',
    //   builder: (context, state) {
    //     Map<String, dynamic> params = state.extra as Map<String, dynamic>;
    //     return SearchProducts(canPop: params["canPop"]);
    //   },
    // ),
    // GoRoute(
    //   path: '/size_chart_images_screen',
    //   builder: (context, state) {
    //     Map<String, dynamic> data = state.extra as Map<String, dynamic>;
    //     return SizeChartImages(sizechart: data['tags']);
    //   },
    // ),
  ],
);
