import 'package:advanced_youtube/Core/api/api_requests.dart';
import 'package:advanced_youtube/Core/api/end_points.dart';
import 'package:advanced_youtube/Core/errors/exception.dart';
import 'package:dio/dio.dart';

class ApiServices extends ApiRequests {
  final Dio _dio;

//! Dio properties
  ApiServices(this._dio) {
    _dio.options.baseUrl = EndPoint.baseUrl;
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

//! Get All Videos
  @override
  Future getAllVideos(String? q) async {
    try {
      final response = (q == null || q == "All")
          ? await _dio.get(EndPoint.allVideos)
          : await _dio.get("${EndPoint.allVideos}&q=$q");
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
          await _dio.get("${EndPoint.allVideos}&channelId=$channelId");
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future getAllShortsVideos() async {
    try {
      final response = await _dio.get(EndPoint.allShortsVideos);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
  
  @override
  Future getSearchedVideos({required String text}) async{
    try {
      final response = await _dio.get("${EndPoint.allSpecificVideos}$text");
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
