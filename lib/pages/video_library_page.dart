import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/video_item.dart';

/// Simple page displaying health videos using YouTubePlayer.
class VideoLibraryPage extends StatelessWidget {
  VideoLibraryPage({super.key});

  final List<VideoItem> _videos = const [
    VideoItem(title: 'วิธีดูแลสุขภาพ', url: 'https://www.youtube.com/watch?v=K18cpp_-gP8'),
    VideoItem(title: 'การออกกำลังกายง่ายๆ', url: 'https://www.youtube.com/watch?v=5qap5aO4i9A'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คลิปสุขภาพ')),
      body: ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final video = _videos[index];
          final controller = YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(video.url) ?? '',
            flags: const YoutubePlayerFlags(autoPlay: false),
          );
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoutubePlayer(controller: controller, showVideoProgressIndicator: true),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(video.title, style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
