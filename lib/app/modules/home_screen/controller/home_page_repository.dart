import 'package:app_using_getx/app/data/models/user_profile_entity.dart';
import 'package:app_using_getx/app/data/network/rest_api_base_domain.dart';
import 'package:app_using_getx/app/data/network/rest_api_call_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeRepository {
  final RestApiCallProvider restApiCallProvider = Get.find<RestApiCallProvider>();

  HomeRepository();

  Future<Either<List<UserProfileData>, BaseDomain>> getProfiles() async {
    try {
      var response =
          await restApiCallProvider.dio.get("https://reqres.in/api/users?page=1");
      if (response.statusCode == 200 && response.data != null) {
        return left(UserProfileEntity.fromJson(response.data).data!);
      } else {
        return right(ServerError(
            errorResponse: response.statusMessage ?? "",
            errorCode: response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return right(NetworkError());
      } else {
        return right(ServerError(errorResponse: e.message ?? ""));
      }
    }
  }
}
