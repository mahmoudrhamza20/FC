import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/core/utils/app_func.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/models/cities_model.dart';
import 'package:freelancer/models/governorates_model.dart';
import 'package:freelancer/screens/privacy_screen.dart';
import 'package:freelancer/widgets/custom_button.dart';
import 'package:freelancer/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

import '../core/utils/validator.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  bool showPassword = true;
  bool showCoPassword = true;
  late String countryValue;
  late String? stateValue;
  late String? cityValue;
  late String? address;
  late String dropdownvalue;
  late String dropdownvalue2;
  late String dropdownvalue3;
  final List<String> items = [
    'Male',
    'Female',
  ];
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final coPasswordController = TextEditingController();
  final genderController = TextEditingController();
  final governorateController = TextEditingController();
  final cityController = TextEditingController();
  final villageController = TextEditingController();

  List<GovernoratesData> governorates = [];
  List<CitiesData> cities = [];

  Future<void> _getGovernorates() async {
    final String jsonData =
        await rootBundle.loadString('assets/json/governorates.json');
    final List<dynamic> data = jsonDecode(jsonData)["data"];

    final List<GovernoratesData> parsedData = data.map((item) {
      return GovernoratesData(
        governorateNameAr: item["governorate_name_ar"], id: item["id"],
        governorateNameEn:
            item["governorate_name_en"], // Make sure this matches the JSON key
        // Map other fields here
      );
    }).toList();

    setState(() {
      governorates = parsedData;
    });
  }

  Future<void> _getCities({required String id}) async {
    final String jsonData =
        await rootBundle.loadString('assets/json/cities.json');
    final List<dynamic> data = await jsonDecode(jsonData)["data"];
    final List<CitiesData> parsedData = data.map((item) {
      return CitiesData(
          id: item["id"],
          governorateId: item["governorate_id"],
          cityNameAr: item["city_name_ar"],
          cityNameEn: item["city_name_en"]);
    }).toList();
    setState(() {
      cities = parsedData.where((city) => city.governorateId == id).toList();
    });
  }

  @override
  void initState() {
    _getGovernorates();
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: 200,
                    color: BrandColors.primary,
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: const Column(
                        children: [
                          Text(
                            "مرحبا بك",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "برجاء استكمال البيانات",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الاسم",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                        startIcon: const Icon(Icons.person),
                        isPassword: false,
                        type: TextInputType.emailAddress,
                        controller: nameController,
                        hintText: 'برجاء ادخال الاسم',
                        endIcon: null,
                        validator: (value) => Validator.name(value),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "كلمة المرور",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                          startIcon: const Icon(Icons.lock),
                          isPassword: showPassword == false ? false : true,
                          type: TextInputType.visiblePassword,
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          validator: (value) => Validator.password(value),
                          endIcon: showPassword == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          controller: passwordController,
                          hintText: 'برجاء ادخال كلمة المرور'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "تأكيد كلمة المرور",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                          startIcon: const Icon(Icons.lock),
                          isPassword: showCoPassword == false ? false : true,
                          type: TextInputType.visiblePassword,
                          validator: (value) => Validator.confirmPassword(
                              value, passwordController.text),
                          onPressed: () {
                            setState(() {
                              showCoPassword = !showCoPassword;
                            });
                          },
                          endIcon: showCoPassword == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          controller: coPasswordController,
                          hintText: 'برجاء ادخال تأكيد كلمة المرور'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "تاريخ الميلاد",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                          startIcon: const Icon(Icons.date_range),
                          isPassword: false,
                          readOnly: true,
                          type: TextInputType.emailAddress,
                          validator: (value) => Validator.generalField(value),
                          controller: dateController,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now());
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dateController.text = formattedDate;
                              });
                            } else {}
                          },
                          hintText: 'برجاء اختيار تاريخ الميلاد',
                          endIcon: null),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "النوع",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                        startIcon: const Icon(Icons.male),
                        hintText: 'برجاء اختيار النوع',
                        readOnly: true,
                        validator: (value) => Validator.generalField(value),
                        isPassword: false,
                        type: TextInputType.text,
                        controller: genderController,
                        endIcon: PopupMenuButton<String>(
                          onSelected: (String newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                              genderController.text = dropdownvalue;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return items
                                .map(
                                  (String value) => PopupMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "المحافظة",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                        startIcon: const Icon(Icons.location_city),
                        hintText: 'برجاء اختيار المحافظة',
                        validator: (value) => Validator.generalField(value),
                        readOnly: true,
                        isPassword: false,
                        type: TextInputType.text,
                        controller: governorateController,
                        endIcon: PopupMenuButton<String>(
                          onSelected: (String newValue) {
                            setState(() {
                              dropdownvalue2 = newValue;
                              governorateController.text = dropdownvalue2;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return governorates
                                .map(
                                  (GovernoratesData value) =>
                                      PopupMenuItem<String>(
                                    value: value.governorateNameAr,
                                    child: Text(value.governorateNameAr),
                                    onTap: () {
                                      _getCities(id: value.id);
                                    },
                                  ),
                                )
                                .toList();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "المدينة",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                        startIcon: const Icon(Icons.location_city),
                        hintText: 'برجاء اختيار المدينة',
                        validator: (value) => Validator.generalField(value),
                        readOnly: true,
                        isPassword: false,
                        type: TextInputType.text,
                        controller: cityController,
                        endIcon: PopupMenuButton<String>(
                          onSelected: (String newValue) {
                            setState(() {
                              dropdownvalue3 = newValue;
                              cityController.text = dropdownvalue3;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return cities
                                .map(
                                  (CitiesData value) => PopupMenuItem<String>(
                                    value: value.cityNameAr,
                                    child: Text(value.cityNameAr),
                                  ),
                                )
                                .toList();
                          },
                        ),
                      ),
                      Text(
                        "القرية / المنطقة",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                          startIcon: const Icon(Icons.location_city),
                          hintText: 'برجاء ادخال اسم القرية او المنطقة',
                          readOnly: true,
                          validator: (value) => Validator.generalField(value),
                          isPassword: false,
                          type: TextInputType.text,
                          controller: villageController,
                          endIcon: null),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: customButton(
                            text: 'التالي',
                            onTap: () async {
                              await AppFunc.getTokenDevice();
                              MagicRouter.navigateTo(const PrivacyScreen());
                            },
                            context: context),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
