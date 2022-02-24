
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:githubrepositories/models/api_model.dart';
import 'package:githubrepositories/services/github_api.dart';
abstract class WebApiBase {

  ///
  /// Using the an Api Model and this Class
  ///  you can easily call on you bloc or service.
  ///
  static final Dio _httpClient = Dio();
  static const String main = GitHubApi.apiMainUrl;
  Future<ApiModel> get({
    @required String controller,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        ///if I decided to use the headers I pass it for here
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };

      final response = await _httpClient.get(
        main + controller,
        queryParameters: queryParameters,
        options: Options(
          contentType: "application/json",
          headers: headers,
        ),
      );
      if( response.data is List<dynamic>) {
        return ApiModel.fromJsonDynamic(response.data);
      } else {
        return ApiModel.fromJson(response.data);
      }
    } on DioError catch (error) {
      if (error.response != null) {
        var errors = await ApiModel().fromJsonAsync(error.response.data);
        return errors;
      } else {

        return ApiModel(success: false, errors: []);
      }
    } catch (error) {
      if (error.response == null) return ApiModel(success: false, errors: []);
      return await ApiModel().fromJsonAsync(error.response.data);
    }
  }

}