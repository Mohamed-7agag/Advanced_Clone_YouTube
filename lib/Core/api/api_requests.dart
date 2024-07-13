abstract class ApiRequests {
  Future<dynamic> getAllVideos(String? q);
  Future<dynamic> getAllShortsVideos();
  Future<dynamic> getChannelDetails({required String channelId});
  Future<dynamic> getVideoStatistics({required String videoId});
  Future<dynamic> getChannelVideos({required String channelId});
  Future<dynamic> getSearchedVideos({required String text});
  
}
