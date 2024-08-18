class EndPoint {
  static String baseUrl = "https://youtube.googleapis.com/youtube/v3/"; 
  static String key = "AIzaSyCnfypfybsZA_F8JXD63biAlCmXCNx5dX0"; 
  static String allVideos =
      "search?key=$key&part=snippet&maxResults=20&type=video&videoDuration=";
  static String allSpecificVideos =
      "search?key=$key&part=snippet&maxResults=20&type=video&videoDuration=medium&q=";
  static String allShortsVideos =
      "search?key=$key&part=snippet&maxResults=20&type=video&videoDuration=short";
  static String statisticsOfVideo =
      "videos?key=$key&part=statistics&id=";
  static String channelDetails =
      "channels?key=$key&part=statistics&part=snippet&id=";
}

class ApiKey {
  static String code = "code";
  static String errorMessage = "ErrorMessage";
  static String errors = "errors";
  static String error = "error";
  static String reason = "reason";
}
