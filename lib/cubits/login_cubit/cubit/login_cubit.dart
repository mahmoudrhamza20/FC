import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/appStorage/local_cache_helper.dart';
import 'package:freelancer/core/routes/magic_router.dart';
import 'package:freelancer/repos/login_repo.dart';
import 'package:freelancer/screens/home_screen.dart';
import 'package:freelancer/widgets/custom_snackbar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final loginRepo = LoginRepo();
  static LoginCubit of(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = true;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(LoginLoading());
      final res = await loginRepo.login(
        password: passwordController.text,
        phone: phoneController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err);
          emit(LoginError());
        },
        (res) {
          showSnackBar(res.message);
          CacheHelper.saveData(key: 'userId', value: res.user.id);
          CacheHelper.saveData(key: 'login', value: true);
          log('-----------------');
          log(CacheHelper.getData(key: 'userId'));
          log('-----------------');
          MagicRouter.navigateAndPopAll(const HomeScreen());
          emit(LoginLoaded());
        },
      );
    }
  }
}
