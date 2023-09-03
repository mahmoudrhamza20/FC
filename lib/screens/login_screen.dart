import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/core/utils/hex_color.dart';
import 'package:freelancer/core/utils/validator.dart';
import 'package:freelancer/screens/home_screen.dart';
import 'package:freelancer/screens/splash_screen.dart';
import 'package:freelancer/widgets/custom_button.dart';
import 'package:freelancer/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
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
                            "برجاء تسجيل الدخول",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "رقم الهاتف",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.w,
                            color: BrandColors.primary),
                      ),
                      SizedBox(height: 5.w),
                      customTextField(
                          startIcon: const Icon(Icons.phone),
                          isPassword: false,
                          validator: (value) => Validator.generalField(value),
                          type: TextInputType.phone,
                          controller: phoneController,
                          hintText: 'برجاء ادخال رقم الهاتف',
                          endIcon: null),
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
                          validator: (value) => Validator.password(value),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          endIcon: showPassword == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          controller: passwordController,
                          hintText: 'برجاء ادخال كلمة المرور'),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "نسيت كلمة السر؟",
                          style: TextStyle(
                              fontSize: 14.w, color: HexColor("#9098B1")),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: customButton(
                            text: 'تسجيل الدخول',
                            onTap: () {
                              // if (_formKey.currentState!.validate()) {
                              //   _formKey.currentState!.save();
                              // MagicRouter.navigateTo(
                              //     const VerificationCodeScreen());
                              // }
                              MagicRouter.navigateAndPopAll(const HomeScreen());
                            },
                            context: context),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ليس لديك حساب؟",
                            style: TextStyle(
                                fontSize: 14.w, color: HexColor("#9098B1")),
                          ),
                          TextButton(
                            onPressed: () {
                              MagicRouter.navigateTo(const SecondPage());
                            },
                            child: Text(
                              'تسجيل حساب',
                              style: TextStyle(
                                  fontSize: 14.w, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.w,
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
