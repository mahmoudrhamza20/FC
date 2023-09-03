import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/appStorage/local_cache_helper.dart';
import 'package:freelancer/repos/register_repo.dart';
import 'package:freelancer/widgets/custom_snackbar.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final registerRepo = RegisterRepo();
  static RegisterCubit of(context) => BlocProvider.of(context);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final coPasswordController = TextEditingController();
  final genderController = TextEditingController();
  final governorateController = TextEditingController();
  final cityController = TextEditingController();
  final villageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future register({required String phone}) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final res = await registerRepo.register(
        phone: phone,
        cityController: cityController.text,
        dateOfBirth: dateController.text,
        gender: genderController.text,
        governorate: governorateController.text,
        passwordConfermation: coPasswordController.text,
        villageController: villageController.text,
        name: nameController.text,
        password: passwordController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err);
          emit(RegisterError());
        },
        (res) async {
          showSnackBar(res.message);

          CacheHelper.saveData(key: 'userId', value: res.user.id);
          CacheHelper.saveData(key: 'login', value: true);
          log('-----------------');
          log(CacheHelper.getData(key: 'userId'));
          log('-----------------');
          //MagicRouter.navigateAndPopAll(MainScreen());
          emit(RegisterLoaded());
        },
      );
    }
  }
}
