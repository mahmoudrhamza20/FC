import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/screens/group_details.dart';
import 'package:freelancer/widgets/custom_button.dart';
import 'package:freelancer/screens/subscribe_group.dart';

class MyGroupsScreen extends StatefulWidget {
  const MyGroupsScreen({super.key});

  @override
  State<MyGroupsScreen> createState() => _MyGroupsScreenState();
}

class _MyGroupsScreenState extends State<MyGroupsScreen> {
  List<DataRow> _testRows() {
    return [
      DataRow(
        cells: [
          DataCell(
            SizedBox(
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Text(index.toString());
                },
              ),
            ),
          ),
          const DataCell(
            Text('Data B'),
          ),
          const DataCell(
            Text('Data C'),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 100,
                color: BrandColors.primary,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "المجموعات الحالية",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            SizedBox(height: 10.h),
            const Text(
              "حدد المجموعات المطلوب متابعتها",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: BrandColors.primary,
                  width: 2,
                ),
              ),
              child: SizedBox(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'م',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: BrandColors.primary,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'رقم المجموعة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: BrandColors.primary,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'المرحلة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: BrandColors.primary,
                        ),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(
                          Text('1'),
                        ),
                        DataCell(
                          TextButton(
                              onPressed: () {
                                MagicRouter.navigateTo(const GroupDetails(
                                  numberGroup: '٥١٢٤',
                                ));
                              },
                              child: const Text('٥١٢٤')),
                        ),
                        const DataCell(
                          Text('الأولي'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(
                          Text('2'),
                        ),
                        DataCell(
                          TextButton(
                              onPressed: () {
                                MagicRouter.navigateTo(const GroupDetails(
                                  numberGroup: '٦٢٥٨',
                                ));
                              },
                              child: const Text('٦٢٥٨')),
                        ),
                        const DataCell(
                          Text('الثانية'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {
                MagicRouter.navigateTo(const SubscribeGroup());
              },
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group_add,
                    size: 40,
                    color: BrandColors.primary,
                  ),
                  Text(
                    'الأشتراك في مجموعة جديدة',
                  )
                ],
              ),
            ),
            SizedBox(height: 15.h),
            customButton(text: 'الحركة المالية', onTap: () {}, context: context)
          ],
        ),
      ),
    );
  }
}
