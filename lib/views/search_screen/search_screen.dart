import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/graph_ql/query/mutation_query.dart';
import 'package:golden_doctor/models/products/product_model.dart';
import 'package:golden_doctor/resources/widgets/product_widget/product_widget.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});
  // final bool canPop;
  @override
  // ignore: library_private_types_in_public_api
  _SearchProductsState createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  final formkey = GlobalKey<FormState>();
  String? searchitem;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          AppImages.horizantelLogo,
          height: 32,
        ),
        // Form(
        //   key: formkey,
        //   child: Container(
        //     // height: 30,
        //     width: MediaQuery.of(context).size.width * 0.9,
        //     decoration: BoxDecoration(
        //       color: Colors.grey[200],
        //     ),
        //     child: Row(
        //       children: <Widget>[
        //         Container(
        //             margin: EdgeInsets.only(left: 5),
        //             padding: EdgeInsets.symmetric(horizontal: 5),
        //             child: Icon(Icons.search)),
        //         Expanded(
        //             flex: 7,
        //             child: Theme(
        //               data: Theme.of(context).copyWith(
        //                 secondaryHeaderColor: Colors.black,
        //                 // colorScheme: Colors.black
        //               ),
        //               child: TextFormField(
        //                 textInputAction: TextInputAction.done,

        //                 //focusNode: _passwordFocus,
        //                 validator: (value) {
        //                   String? value;
        //                   if (value!.trim().isEmpty) {
        //                     value = ' Field Empty';
        //                   }
        //                   return value;
        //                 },

        //                 cursorColor: Color(0xff1f1f1f),
        //                 onFieldSubmitted: (value) {
        //                   print('validate');
        //                   setState(() {
        //                     searchitem = value;
        //                   });
        //                 },
        //                 controller: searchController,
        //                 onSaved: (value) {
        //                   //password = value;
        //                 },
        //                 // focusNode: searchNode,

        //                 style: TextStyle(color: Colors.black, fontSize: 13),
        //                 decoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   focusedBorder: InputBorder.none,
        //                   enabledBorder: InputBorder.none,
        //                   errorBorder: InputBorder.none,
        //                   disabledBorder: InputBorder.none,
        //                   hintText: 'Search...',
        //                   hintStyle:
        //                       TextStyle(color: Colors.grey, fontSize: 15),
        //                 ),
        //               ),
        //             )),
        //         Expanded(
        //           flex: 1,
        //           child: InkWell(
        //             onTap: () {
        //               searchController.clear();
        //             },
        //             child: Container(
        //                 //  margin: EdgeInsets.only(left:5),
        //                 // padding: EdgeInsets.symmetric(horizontal: 5),
        //                 child: Icon(Icons.close)),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),

        // leading:
        //     //  widget.canPop
        //     //     ?
        //     IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_new,
        //     size: 15,
        //   ), // Use Cupertino icon
        //   onPressed: () {
        //     context.pop();
        //   },
        // ),
        // : SizedBox(),
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: SizedBox(
                    // height: 36.h,
                    child: TextFormField(
                      controller: TextEditingController(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      // enableInteractiveSelection: true,
                      showCursor: true,

                      cursorHeight: 16,
                      decoration: InputDecoration(
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.greyDE,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(color: AppColors.grey)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(color: AppColors.myPrimary)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide:
                                const BorderSide(color: AppColors.myPrimary)),
                        hintText: 'Search for products',
                        hintStyle: TextStyle(
                          color: AppColors.greyDE,
                          fontSize: 13.sp,
                        ),
                        // floatingLabelStyle: TextStyle(
                        //     color: AppColors.myPrimary, fontSize: 13.sp),
                      ),
                    ),
                  ),
                ),

                // Form(
                //   key: formkey,
                //   child: Container(
                //     // height: 30,
                //     width: MediaQuery.of(context).size.width * 0.9,
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //     ),
                //     child: Row(
                //       children: <Widget>[
                //         Container(
                //             margin: EdgeInsets.only(left: 5),
                //             padding: EdgeInsets.symmetric(horizontal: 5),
                //             child: Icon(Icons.search)),
                //         Expanded(
                //             flex: 7,
                //             child: Theme(
                //               data: Theme.of(context).copyWith(
                //                 secondaryHeaderColor: Colors.black,
                //                 // colorScheme: Colors.black
                //               ),
                //               child: TextFormField(
                //                 textInputAction: TextInputAction.done,

                //                 //focusNode: _passwordFocus,
                //                 validator: (value) {
                //                   String? value;
                //                   if (value!.trim().isEmpty) {
                //                     value = ' Field Empty';
                //                   }
                //                   return value;
                //                 },

                //                 cursorColor: Color(0xff1f1f1f),
                //                 onFieldSubmitted: (value) {
                //                   print('validate');
                //                   setState(() {
                //                     searchitem = value;
                //                   });
                //                 },
                //                 controller: searchController,
                //                 onSaved: (value) {
                //                   //password = value;
                //                 },
                //                 // focusNode: searchNode,

                //                 style: TextStyle(
                //                     color: Colors.black, fontSize: 13),
                //                 decoration: InputDecoration(
                //                   border: InputBorder.none,
                //                   focusedBorder: InputBorder.none,
                //                   enabledBorder: InputBorder.none,
                //                   errorBorder: InputBorder.none,
                //                   disabledBorder: InputBorder.none,
                //                   hintText: 'Search...',
                //                   hintStyle: TextStyle(
                //                       color: Colors.grey, fontSize: 15),
                //                 ),
                //               ),
                //             )),
                //         Expanded(
                //           flex: 1,
                //           child: InkWell(
                //             onTap: () {
                //               searchController.clear();
                //             },
                //             child: Container(
                //                 //  margin: EdgeInsets.only(left:5),
                //                 // padding: EdgeInsets.symmetric(horizontal: 5),
                //                 child: Icon(Icons.close)),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                    // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: searchitem != null
                        ? Query(
                            options: QueryOptions(
                                document: gql(
                                  finalsearchProducts,
                                ), // this is the query string you just created
                                variables: {
                                  'Search':
                                      "title:$searchitem OR tag:$searchitem*"
                                }),
                            builder: (QueryResult? result,
                                {VoidCallback? refetch, FetchMore? fetchMore}) {
                              if (result!.hasException) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AppImages.searchImages,
                                        height: 40.h,
                                        width: 40.w,
                                      ),
                                      Text(
                                        "Bad Connection",
                                        style: AppTextStyles.headline1.copyWith(
                                            color: AppColors.myPrimary),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              if (result.isLoading) {
                                return const Center(
                                  child: Text('Loading'),
                                );
                              }

                              if (result.data != null) {
                                // log("-----new----");
                                // Data totalDataProducts =
                                //     Data.fromJson(result.data!);
                                // log('Total Data = ${result.data!['products']}');
                                dynamic resData = jsonEncode(
                                    result.data!['products']['edges']);
                                List responseList = jsonDecode(resData);
                                // log("------1---------");
                                // log("1111111111111 s${resData}");
                                // log("-------1-------");

                                List<ProductsEdge> productsEdges =
                                    List<ProductsEdge>.from(responseList
                                        .map((x) => ProductsEdge.fromJson(x)));
                                // ProductsEdge.fromJson(resData['products']['edges'] as Map<String, dynamic>));

                                // as List<ProductsEdge>;

                                // log('productsEdges = $productsEdges');

                                // Future.delayed(
                                //   Duration.zero,
                                //   () {
                                //     ref
                                //         .read(
                                //             collectionsProductsProvider.notifier)
                                //         .addProducts(productsEdges);
                                //   },
                                // );

                                return
                                    // Text(
                                    // '${result.data!['products']['edges'][0]['node'].toString()}',
                                    // productsEdges.length.toString());
                                    SingleChildScrollView(
                                        child: //Text(result.data.toString()));
                                            productsEdges == []
                                                ? const SizedBox()
                                                : SizedBox(
                                                    child: GridView.builder(
                                                      itemCount:
                                                          productsEdges.length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        childAspectRatio: 3 / 6,
                                                        crossAxisSpacing: 0,
                                                        mainAxisSpacing: 0,
                                                      ),
                                                      itemBuilder:
                                                          (context, index) {
                                                        // PurpleNode
                                                        //     singleProductNode =
                                                        //     productsEdges[index]
                                                        //         .node;
                                                        // single
                                                        return ProductWidget();
                                                        //  ProductCard(
                                                        //   purpleNode:
                                                        //       singleProductNode,
                                                        // );
                                                      },
                                                    ),
                                                  ));
                              } else {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppImages.searchImages),
                                      Text(
                                        "Empty",
                                        style: AppTextStyles.headline1.copyWith(
                                            color: AppColors.myPrimary),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            })
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage(
                                  AppImages.searchImages,
                                ),
                              )
                            ],
                          )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
