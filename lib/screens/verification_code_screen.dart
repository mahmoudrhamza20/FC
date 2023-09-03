import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/core/utils/brand_colors.dart';
import 'package:freelancer/screens/complete_screen.dart';
import 'package:freelancer/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({
    super.key,
  });
  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(70, 69, 66, 1),
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 253, 222),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 146, 160, 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 150,
                  color: BrandColors.primary,
                  child: const Center(child: Text("")),
                ),
              ),
              const Text(
                'Verification code',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Pinput(
                    length: 6,
                    controller: controller,
                    focusNode: focusNode,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                            offset: Offset(0, 3),
                            blurRadius: 16,
                          )
                        ],
                      ),
                    ),
                    validator: (s) {
                      return s == '111111' ? null : '';
                    },
                    onCompleted: (value) {
                      // widget.code = value;
                      // cubit.checkCode(code: value);
                    },
                    showCursor: true,
                    cursor: cursor,
                  )),
              SizedBox(height: 20.h),
              customButton(
                  text: 'Next',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      MagicRouter.navigateAndPopAll(
                          const CompleteProfileScreen());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: BrandColors.primary,
                        content: Text(
                          'Verification code Incorrect',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      ));
                    }
                  },
                  context: context)
            ],
          ),
        ),
      ),
    );
  }
}
