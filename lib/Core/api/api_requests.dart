abstract class ApiRequests {
  Future<dynamic> getAllVideos(String? q,String videoType);
  Future<dynamic> getChannelDetails({required String channelId});
  Future<dynamic> getVideoStatistics({required String videoId});
  Future<dynamic> getChannelVideos({required String channelId});
  Future<dynamic> getSearchedVideos({required String text});
  
}
