class EndPoint {
  static String baseUrl = "https://youtube.googleapis.com/youtube/v3/"; 
  static String key = "AIzaSyBY9dMy6nuSogmzb-QvM_-Q-jOq0zaUlTc"; 
  static String allVideos =
      "search?key=$key&part=snippet&maxResults=50&type=video&videoDuration=medium";
  static String allSpecificVideos =
      "search?key=$key&part=snippet&maxResults=50&type=video&videoDuration=medium&q=";
  static String allShortsVideos =
      "search?key=$key&part=snippet&maxResults=50&type=video&videoDuration=short";
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
