import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/data/models/video_model.dart';
import 'package:video_player/video_player.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: Text('Video List')),
      body: Obx(() {
        if (controller.isLoading.value && controller.videoModel.value == null) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.hasError.value) {
          return Center(child: Text('Failed to load videos.'));
        }

        final videos = controller.videoModel.value?.data?.data ?? [];

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isLoading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.loadMore();
            }
            return true;
          },
          child: ListView.builder(
            itemCount: videos.length + 1,
            itemBuilder: (context, index) {
              if (index < videos.length) {
                final video = videos[index];
                return VideoListItem(video: video);
              } else {
                return Obx(() {
                  return controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox();
                });
              }
            },
          ),
        );
      }),
    );
  }
}

class VideoListItem extends StatefulWidget {
  final VideoData video;

  VideoListItem({required this.video});

  @override
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.cdnUrl!))
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Center(child: CircularProgressIndicator()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
