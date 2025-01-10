import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/utils/app_colors.dart';

List filterdata = [
  {
    "title": "Gender",
    "values": ["Men", "Women", "Other"],
  },
  {
    "title": "Age",
    "values": ["18-24", "25-34", "35-44", "45-54", "55-64", "65+"],
  },
  {
    "title": "Color",
    "values": ["Red", "Blue", "Green"],
  },
];

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("FILTER BY"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filterdata.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            dense: true,
            //  visualDensity: VisualDensity.maximumDensity,
            collapsedShape: Border.fromBorderSide(
                BorderSide(width: 0.5, color: AppColors.greyCA)),
            title: Text("title"),
            children: [
              Text("data"),
              Text("data1"),
              Text("data2"),
              Text("data3"),
            ],
          );
        },
      ),
    );
  }
}
