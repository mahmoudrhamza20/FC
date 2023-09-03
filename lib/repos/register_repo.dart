// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:freelancer/core/utils/dio_string.dart';
import '../../../../core/utils/dio_helper.dart';
import '../models/user_model.dart';

class RegisterRepo {
  Future<Either<dynamic, UserModel>> register({
    required String name,
    required String phone,
    required String gender,
    required String passwordConfermation,
    required String password,
    required String dateOfBirth,
    required String governorate,
    required String cityController,
    required String villageController,
  }) async {
    final response = await DioHelper.post(EndPoints.register, body: {
      'name': name,
      'phone': phone,
      'password': password,
      'gender': gender,
      'confirm_password': passwordConfermation,
      'dob': dateOfBirth,
      'country': governorate,
      'address': cityController,
      'region': villageController,
      'device_token': 'device_token',
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json'
    });
    try {
      if (response.statusCode == 200 && response.data['status'] == true) {
        print("Success RegisterRepo");
        print(response.data);
        return Right(UserModel.fromJson(jsonDecode(response.toString())));
      } else {
        print(response);
        return Left(response.data);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
