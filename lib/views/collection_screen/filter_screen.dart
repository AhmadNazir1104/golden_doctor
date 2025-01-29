import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/view_models/collection_product_view_model/collection_view_model.dart';
import 'package:golden_doctor/view_models/language_provider.dart';

List filterdata = [
  {
    "title": "Gender",
    "values": ["Men", "Women", "Other"],
  },
  {
    "title": "Age",
    "values": [
      "18-24",
      "25-34",
      "35-44",
      "45-54",
      "55-64",
      "65+",
      "25-34",
      "35-44",
      "45-54",
      "55-64",
      "65+",
      "25-34",
      "35-44",
      "45-54",
      "55-64",
      "65+"
    ],
  },
  {
    "title": "Size",
    "values": ["S", "Xs", "M", "L", "XL", "2XL", "3XL", "4XL"],
  },
  {
    "title": "Color",
    "values": ["Red", "Blue", "Green", "Green"],
  },
];

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> localFilterWatch = ref.watch(filterProviderLocal);
    final localFilterRead = ref.read(filterProviderLocal.notifier);
    // final filterproviderRead = ref.read(filterProvider.notifier);
    return Directionality(
      textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("FILTER BY".tr),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: filterdata.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    dense: true,
                    //  visualDensity: VisualDensity.maximumDensity,
                    collapsedShape: Border(
                      bottom: BorderSide(width: 0.5, color: AppColors.greyCA),
                      top: index == 0
                          ? BorderSide(width: 0.5, color: AppColors.greyCA)
                          : BorderSide.none,
                    ),
                    title: Text(
                      filterdata[index]["title"].toString().tr,
                      style: AppTextStyles.body2.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    children: [
                      GridView.builder(
                          itemCount: filterdata[index]["values"].length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 12 / 3),
                          itemBuilder: (context, valueIndex) {
                            return CheckboxListTile.adaptive(
                              value: localFilterWatch.contains(
                                  filterdata[index]["values"][valueIndex]),
                              title: Text(
                                filterdata[index]["values"][valueIndex],
                                style: AppTextStyles.body2,
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                List<String> temp = localFilterRead.state;
                                temp.contains(
                                        filterdata[index]["values"][valueIndex])
                                    ? temp.remove(
                                        filterdata[index]["values"][valueIndex])
                                    : temp.add(filterdata[index]["values"]
                                        [valueIndex]);
                                localFilterRead.state = [
                                  ...localFilterRead.state
                                ];
                              },
                            );
                          }),
                      // Text("data"),
                      // Text("data1"),
                      // Text("data2"),
                      // Text("data3"),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                spacing: 10.w,
                children: [
                  Expanded(
                    child: AppButtons.myOutlinedButton(
                      context: context,
                      text: "CLEAR ALL".tr,
                      onPressed: () {},
                    ),
                  ),
                  // SizedBox.expand(),
                  Expanded(
                    child: AppButtons.myprimaryButton(
                      onPressed: () {},
                      text: "VIEW".tr,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
