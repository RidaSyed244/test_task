import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/data/repositories/video_repository.dart';
import 'package:test_task/data/services/api_service.dart';
import 'package:test_task/domain/usecases/fetch_video_usecase.dart';
import 'package:test_task/presentation/controllers/home_controller.dart';
import 'package:test_task/presentation/pages/home/home_page.dart';

void main() {
  // Initialize dependency injection
  Get.lazyPut<ApiService>(() => ApiService());
  Get.lazyPut<VideoRepository>(
      () => VideoRepository(apiService: Get.find<ApiService>()));
  Get.lazyPut<FetchVideosUseCase>(
      () => FetchVideosUseCase(repository: Get.find<VideoRepository>()));
  Get.lazyPut<HomeController>(
      () => HomeController(fetchVideosUseCase: Get.find<FetchVideosUseCase>()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
