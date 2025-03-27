import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_state.dart';

void main() {
  group('VideoLessonState', () {
    group('VideoLessonLoading', () {
      test('initializes correctly', () {
        // Arrange & Act
        const state = VideoLessonLoading();

        // Assert
        expect(state, isA<VideoLessonState>());
      });
    });

    group('VideoLessonFailed', () {
      test('initializes correctly', () {
        // Arrange & Act
        const state = VideoLessonFailed();

        // Assert
        expect(state, isA<VideoLessonState>());
      });
    });

    group('VideoLessonLoaded', () {
      test('initializes with required parameters', () {
        // Arrange
        const testUrl = 'https://example.com/video.mp4';
        const testOrientation = Orientation.landscape;

        // Act
        final state = const VideoLessonLoaded(
          lessonUrl: testUrl,
          videoOrientation: testOrientation,
        );

        // Assert
        expect(state, isA<VideoLessonState>());
        expect(state.lessonUrl, equals(testUrl));
        expect(state.videoOrientation, equals(testOrientation));
      });

      test('initializes with portrait orientation', () {
        // Arrange
        const testUrl = 'https://example.com/video.mp4';
        const testOrientation = Orientation.portrait;

        // Act
        final state = const VideoLessonLoaded(
          lessonUrl: testUrl,
          videoOrientation: testOrientation,
        );

        // Assert
        expect(state.videoOrientation, equals(Orientation.portrait));
      });
    });
  });
}
