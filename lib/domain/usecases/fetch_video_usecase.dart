import 'package:test_task/data/models/video_model.dart';
import 'package:test_task/data/repositories/video_repository.dart';

class FetchVideosUseCase {
  final VideoRepository repository;

  FetchVideosUseCase({required this.repository});

  Future<VideoModel> execute(int page, int limit, String country) {
    return repository.fetchVideos(page, limit, country);
  }
}
