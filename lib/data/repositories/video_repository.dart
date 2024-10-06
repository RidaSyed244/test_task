import 'package:test_task/data/models/video_model.dart';
import 'package:test_task/data/services/api_service.dart';

class VideoRepository {
  final ApiService apiService;

  VideoRepository({required this.apiService});

  Future<VideoModel> fetchVideos(int page, int limit, String country) async {
    final data = await apiService.fetchVideos(page, limit, country);
    return VideoModel.fromJson(data);
  }
}
