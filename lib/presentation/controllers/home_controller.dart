import 'package:get/get.dart';
import 'package:test_task/data/models/video_model.dart';
import 'package:test_task/domain/usecases/fetch_video_usecase.dart';

class HomeController extends GetxController {
  final FetchVideosUseCase fetchVideosUseCase;

  var videoModel = Rx<VideoModel?>(null);
  var isLoading = RxBool(false);
  var hasError = RxBool(false);
  int currentPage = 1;
  final int limit = 10;
  final String country = 'United+States';
  HomeController({required this.fetchVideosUseCase});

  @override
  void onInit() {
    super.onInit();
    fetchVideos(currentPage);
  }

  void fetchVideos(int page) async {
    isLoading.value = true;
    hasError.value = false;

    try {
      final fetchedVideos =
          await fetchVideosUseCase.execute(page, limit, country);
      if (videoModel.value == null) {
        videoModel.value = fetchedVideos;
      } else {
        videoModel.value!.data!.data!.addAll(fetchedVideos.data!.data!);
      }
      currentPage++;
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void loadMore() {
    if (!isLoading.value && !hasError.value) {
      fetchVideos(currentPage);
    }
  }
}
