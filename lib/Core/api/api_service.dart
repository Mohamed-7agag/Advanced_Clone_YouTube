import 'package:advanced_youtube/Core/api/api_requests.dart';
import 'package:advanced_youtube/Core/api/end_points.dart';
import 'package:advanced_youtube/Core/errors/exception.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices extends ApiRequests {
  final Dio _dio;

//! Dio properties
  ApiServices(this._dio) {
    _dio.options.baseUrl = EndPoint.baseUrl;
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

//! Get All Videos
  @override
  Future getAllVideos(String? q, String videoType) async {
    try {
      String endpoints = "";
      if (q == null || q == "All") {
        endpoints = EndPoint.allVideos + videoType;
      } else {
        endpoints = "${EndPoint.allVideos}$videoType&q=$q";
      }
      final response = await _dio.get(endpoints);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

//! Get ChannelDetails
  @override
  Future getChannelDetails({required String channelId}) async {
    try {
      final response = await _dio.get("${EndPoint.channelDetails}$channelId");
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

//! Get VideoStatistics
  @override
  Future getVideoStatistics({required String videoId}) async {
    try {
      final response = await _dio.get("${EndPoint.statisticsOfVideo}$videoId");
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

//! Get All Videos of a Specific Channel
  @override
  Future getChannelVideos({required String channelId}) async {
    try {
      final response =
          await _dio.get("${EndPoint.allVideos}medium&channelId=$channelId");
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future getSearchedVideos({required String text}) async {
    try {
      final response = await _dio.get("${EndPoint.allSpecificVideos}$text");
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
