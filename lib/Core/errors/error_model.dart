import 'package:advanced_youtube/Core/api/end_points.dart';

//! errorModel for Api when error occur
class ErrorModel {
  final int code;
  final String errorMessage;
  final String reason;

  ErrorModel(
      {required this.code, required this.errorMessage, required this.reason});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      code: jsonData[ApiKey.error][ApiKey.code],
      errorMessage: jsonData[ApiKey.error][ApiKey.errorMessage],
      reason: jsonData[ApiKey.error][ApiKey.errors][ApiKey.reason],
    );
  }
}
