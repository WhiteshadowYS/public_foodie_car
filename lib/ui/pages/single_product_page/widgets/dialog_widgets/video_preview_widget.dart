import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/custom_animated_play_icon_widget.dart';
import 'package:my_catalog/widgets/fade_animation_container.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewWidget extends StatefulWidget {
  final String videoUrl;

  VideoPreviewWidget({@required this.videoUrl})
      : assert(videoUrl != null, throw ('videoUrl should be not null')),
        super(key: Key('VideoPreviewWidget'));

  @override
  _VideoPreviewWidgetState createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoUrl,
    )
      ..addListener(videoListener)
      ..initialize().then(
        (_) {
          /// Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        },
      );
  }

  @override
  void dispose() {
    _controller.removeListener(videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.initialized) {
      /// If the VideoPlayerController has finished initialization, use
      /// the data it provides to limit the aspect ratio of the VideoPlayer.
      return InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,

              /// Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            ),
            Positioned.fill(
              child: Align(
                child: AnimatedOpacity(
                  duration: _controller.value.isPlaying ? SECONDS_1 : MILLISECONDS_300,
                  opacity: _controller.value.isPlaying ? 0 : 1,
                  child: Container(
                    width: 100.sp,
                    height: 100.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: CustomTheme.colors.buttons, width: 2.0),
                      color: CustomTheme.colors.primaryColor.withOpacity(0.3),
                    ),
                    child: _videoControlButton(),
                  ),
                ),
              ),
            ),
            VideoProgressIndicator(
              _controller,
              allowScrubbing: _controller.value.duration.compareTo(_controller.value.position) == 1,
              colors: VideoProgressColors(
                playedColor: CustomTheme.colors.primaryColor,
                backgroundColor: CustomTheme.colors.accentColor,
              ),
            ),
          ],
        ),
      );
    } else {
      /// If the VideoPlayerController is still initializing, show a loader
      return FadeAnimationContainer();
    }
  }

  void onTap() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  Widget _videoControlButton() {
    if (_controller.value.duration.compareTo(_controller.value.position) != 1) {
      return IconButton(
        icon: Icon(Icons.repeat),
        color: CustomTheme.colors.buttons,
        iconSize: 50.h,
        onPressed: () async {
          await _controller.seekTo(Duration.zero);
          await _controller.play();
        },
      );
    }
    return CustomAnimatedPlayIconWidget(
      size: 30.h,
      duration: MILLISECONDS_200,
      color: CustomTheme.colors.buttons,
      strokeColor: CustomTheme.colors.buttons,
      controller: _controller,
    );
  }

  void videoListener() {
    setState(() {});
  }
}
