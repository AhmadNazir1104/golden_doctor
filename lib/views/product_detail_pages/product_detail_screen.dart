import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/models/product_quantity_model.dart/product_quantity_model.dart';
import 'package:golden_doctor/models/products/product_model.dart';
import 'package:golden_doctor/resources/widgets/product_widget/color_palette_widget.dart';
import 'package:golden_doctor/resources/widgets/product_widget/pdp_product_carousel.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/selectable_textbox.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:golden_doctor/view_models/language_provider.dart';
import 'package:golden_doctor/view_models/product_details_view_model.dart';

var list = [
  {
    "title": "black",
    "code": "0xff2345f",
  },
];
List col = [
  "black",
  "red",
  "green",
  "orange",
  "yello",
  "black",
  "red",
  "green",
  "orange",
  "yello",
];

List fittype = [
  "Regular",
  "Petite",
];
final imglist = [
  "https://scrubser-shop.com/wp-content/uploads/2024/02/CK131A_A.jpg",
  "https://scrubser-shop.com/wp-content/uploads/2024/02/CK131A_A.jpg",
  "https://scrubser-shop.com/wp-content/uploads/2024/02/CK131A_A.jpg",
];

final carouselIndex = StateProvider<int>((ref) {
  return 0;
});

class ProductDetailScreen extends ConsumerStatefulWidget {
  final ProductNode singleProduct;
  const ProductDetailScreen({
    super.key,
    required this.singleProduct,
  });

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late final Future<List<ProductEdge>?> popularProducts;
  late final Future<List<ProductEdge>?> recomandedProducts;
  final uniquePageKey = DateTime.now().toUtc().toString();
  @override
  void initState() {
    print("product page init");
    ref
        .read(productDetailsProvider(uniquePageKey).notifier)
        .productQuentity(context, widget.singleProduct.id);

    Future.delayed(Duration(seconds: 0)).then((value) {
      ref.read(productDetailsProvider(uniquePageKey).notifier).selectOption(
            widget.singleProduct.variants.edges[0].node.selectedOptions,
          );
      recomandedProducts = ref
          .read(productDetailsProvider(uniquePageKey).notifier)
          .fetchProducts(
            collectionId: widget.singleProduct.productRecomandationMetafield,
          );
      popularProducts = ref
          .read(productDetailsProvider(uniquePageKey).notifier)
          .fetchProducts(
            collectionId: widget.singleProduct.youMayAlsoLikeMetafield,
          );
    });
    print("11111111");
    print(widget.singleProduct.productRecomandationMetafield);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentImgIndex = ref.watch(carouselIndex);
    // final cartRead = ref.read(cartProvider.notifier);
    // final List<CartModel> cartList = ref.watch(cartProvider);

    final optionsWatch = ref.watch(productDetailsProvider(uniquePageKey));
    final optionsRead =
        ref.read(productDetailsProvider(uniquePageKey).notifier);
    VariantsEdge selectedVariant = optionsRead.selectVariant(
        purpleNode: widget.singleProduct, selectedOptionsList: []);
    ProductQuantityModel? productQuantityModel;
    List<ImagesEdge> imageEdges;
    // ------ create image list if specific color variant------
    imageEdges = widget.singleProduct.images.edges;
    if (optionsWatch.isNotEmpty) {
      imageEdges = [
        ...widget.singleProduct.images.edges
            .where((e) => e.node.altText == optionsWatch[0].value),
        // e.node.altText == selectedVariant.node.selectedOptions[0].value),
      ];
    }
    if (imageEdges.isEmpty) {
      imageEdges = widget.singleProduct.images.edges;
    }
    final Options? sizeOption = widget.singleProduct.options
        .firstWhereOrNull((element) => element.name == "Size");
    final Options? fitOption = widget.singleProduct.options
        .firstWhereOrNull((element) => element.name == "Length");
    final Options? colorOption = widget.singleProduct.options
        .firstWhereOrNull((element) => element.name == "Color");

    return Directionality(
      textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        body: optionsWatch.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: <Widget>[
                  // -------- image carousel. -----------

                  SliverAppBar(
                    toolbarHeight: 33,
                    expandedHeight: 409.h,
                    pinned: true,
                    backgroundColor: AppColors.myScaffold,
                    elevation: 0,
                    forceElevated: false,
                    surfaceTintColor: AppColors.myScaffold,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      titlePadding: EdgeInsets.zero,
                      collapseMode: CollapseMode.pin,
                      background: Stack(
                        children: [
                          Positioned.fill(
                            child: CarouselSlider.builder(
                              itemCount: imageEdges.length, //imglist.length,
                              itemBuilder: (contaxt, index, _) {
                                return CachedNetworkImage(
                                  imageUrl: imageEdges[index].node.url,
                                  fit: BoxFit.fill,
                                  height: double.infinity,
                                  width: double.infinity,
                                  placeholder: (context, url) => SizedBox(
                                    height: 70.h,
                                    width: 70.w,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                          AppImages.horizantelLogo,
                                        ),
                                        fit: BoxFit.contain,
                                        height: 70.h,
                                        width: 120.w,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                );
                              },
                              options: CarouselOptions(
                                aspectRatio: 3 / 6,
                                viewportFraction: 1,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) => ref
                                    .read(carouselIndex.notifier)
                                    .state = index,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 60.h,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: imglist.asMap().entries.map((entry) {
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: entry.key == currentImgIndex
                                        ? AppColors.blue575
                                        : AppColors.myScaffold,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 30.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(70),
                                ),
                                color: AppColors.myScaffold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // bottom: PreferredSize(
                    //   preferredSize: Size(double.infinity, 30.h),
                    //   child:
                    // ),
                  ),

                  // -------- product details. --------
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text(
                            widget.singleProduct.title,
                            style: AppTextStyles.headline2.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            widget.singleProduct.vendor ?? "",
                            style: AppTextStyles.lable3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          // ------- Color Options -------

                          colorOption != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "COLOR    ".tr,
                                          style:
                                              AppTextStyles.headline3.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          optionsWatch[0].value,
                                          // selectedVariant.node.selectedOptions[0].value,
                                          style: AppTextStyles.lable3,
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        ...colorOption.optionValues.map(
                                          (e) => ColorPalateWidget(
                                            optionKey: colorOption.name,
                                            optionValue: e.name,
                                            uniquePageKey: uniquePageKey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                )
                              : SizedBox(),

                          // ------- Size Type -------
                          // widget.singleProduct.options.length > 2
                          // widget.singleProduct.options.any((e) => e.name == "Fit")
                          fitOption != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "SIZE TYPE    ".tr,
                                          style:
                                              AppTextStyles.headline3.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(optionsWatch[1].value,
                                            style: AppTextStyles.lable3),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 29,
                                      child: ListView.builder(
                                        itemCount:
                                            fitOption.optionValues.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              var temp = optionsWatch;
                                              temp[temp.indexWhere((e) =>
                                                      e.name ==
                                                      fitOption.name)] =
                                                  SelectedOption(
                                                name: fitOption.name,
                                                value: fitOption
                                                    .optionValues[index].name,
                                              );

                                              optionsRead.selectOption(temp);
                                            },
                                            child: SelectableTextBox(
                                              text: fitOption.name,
                                              isSelected: fitOption
                                                          .optionValues[index]
                                                          .name ==
                                                      optionsWatch
                                                          .firstWhere((x) =>
                                                              x.name ==
                                                              fitOption.name)
                                                          .value
                                                  ? true
                                                  : false,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                )
                              : SizedBox(),
                          // ------- Size -------
                          // widget.singleProduct.options.any((e) => e.name == "Size")
                          sizeOption != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "SIZE".tr,
                                          style:
                                              AppTextStyles.headline3.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "What's my size?".tr,
                                          style: AppTextStyles.lable3.copyWith(
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      children: [
                                        ...sizeOption.optionValues.map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              var temp = optionsWatch;
                                              temp[temp.indexWhere((e) =>
                                                      e.name ==
                                                      sizeOption.name)] =
                                                  SelectedOption(
                                                name: sizeOption.name,
                                                value: e.name,
                                              );
                                              optionsRead.selectOption(temp);
                                            },
                                            child: SelectableTextBox(
                                              text: e.name,
                                              isSelected: e.name ==
                                                      optionsWatch
                                                          .firstWhere((x) =>
                                                              x.name ==
                                                              sizeOption.name)
                                                          .value
                                                  ? true
                                                  : false,
                                              maxWidth: 50.w,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox(),

                          // SizedBox(height: 10.h),
                          Divider(
                            color: AppColors.greyDE,
                          ),
                          // ------- Price -------
                          Row(
                            children: [
                              Text(
                                "SAR ${selectedVariant.node.price.amount}",
                                style: AppTextStyles.headline3,
                              ),
                              SizedBox(width: 20),
                              Flexible(
                                child: AppButtons.myprimaryButton(
                                  onPressed: () {},
                                  text: 'ADD TO BAG'.tr,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 10),
                          // ------- Add to cart -------
                          AppButtons.myTextButton(
                            text: "Size Chart",
                            textStyle: AppTextStyles.lable3.copyWith(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              // color: appcolor
                            ),
                            onPressed: () {},
                            context: context,
                          ),
                          // ------- Size Chart-------
                          Text(
                            "PERSONALIZE",
                            style: AppTextStyles.headline3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 17.w),
                            // margin: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Add Embroidery"),
                                Text("From 14 SAR"),
                              ],
                            ),
                          ),
                          // ------- Expanded tiles -------
                          ExpansionTile(
                            shape: Border(),
                            minTileHeight: 5.h,
                            tilePadding: EdgeInsets.all(0),
                            title: Text(
                              "DESCRIPTION",
                              style: AppTextStyles.headline3.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: AppColors.buttonColor,
                              size: 25,
                            ),
                            children: [
                              Html(
                                data: widget.singleProduct.descriptionHtml,
                              ),
                            ],
                          ),
                          ExpansionTile(
                            shape: Border(),
                            minTileHeight: 5.h,
                            tilePadding: EdgeInsets.all(0),
                            title: Text(
                              "DELIVERY & RETURNS",
                              style: AppTextStyles.headline3.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: AppColors.buttonColor,
                              size: 25,
                            ),
                            children: [
                              Html(
                                data: "",
                              ),
                            ],
                          ),
                          // PdpProductCarousel(
                          //   productIdList: ["", "", ""],
                          //   sectionTitle: "Recomanded Product",
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // ------- Product Builders -------
                  SliverList.list(
                    children: [
                      FutureBuilder(
                          future: recomandedProducts,
                          builder: (context, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snap.hasError ||
                                (snap.data == null &&
                                    snap.connectionState !=
                                        ConnectionState.waiting)) {
                              return SizedBox();
                            }
                            return PdpProductCarousel(
                              products: snap.data ?? [],
                              sectionTitle: "Recomanded Product",
                            );
                          }),
                      FutureBuilder(
                          future: popularProducts,
                          builder: (context, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snap.hasError ||
                                (snap.data == null &&
                                    snap.connectionState !=
                                        ConnectionState.waiting)) {
                              return SizedBox();
                            }
                            return PdpProductCarousel(
                              products: snap.data ?? [],
                              sectionTitle: "Popular Product",
                            );
                          }),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
