// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:freelancer/core/utils/dio_helper.dart';
import 'package:freelancer/core/utils/dio_string.dart';
import 'package:freelancer/models/error_model.dart';

import '../models/user_model.dart';

class LoginRepo {
  Future<Either<String, UserModel>> login(
      {required String phone, required String password}) async {
    final response = await DioHelper.post(EndPoints.login, body: {
      'phone': phone,
      'password': password,
      'device_token': 'device_token',
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json'
    });
    //log(CacheHelper.getData(key: 'lang'));
    try {
      if (response.statusCode == 200 && response.data['status'] == true) {
        print("Success LoginRepo");
        print(response.data);
        return Right(UserModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
