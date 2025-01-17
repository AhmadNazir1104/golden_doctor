import 'dart:io';


class UploadState {
  final List<File> pdfFiles;
  final List<File> videoFiles;
  final List<File> imageFiles;
  final bool isLoading;
  final String? errorMessage;
  // final List<Review> userReviews;

  const UploadState({
    this.pdfFiles = const [],
    this.videoFiles = const [],
    this.imageFiles = const [],
    this.isLoading = false,
    this.errorMessage,
    // this.userReviews = const [],
  });

  UploadState copyWith({
    List<File>? pdfFiles,
    List<File>? videoFiles,
    List<File>? imageFiles,
    bool? isLoading,
    String? errorMessage,
    // List<Review>? userReviews,
  }) {
    return UploadState(
      pdfFiles: pdfFiles ?? this.pdfFiles,
      videoFiles: videoFiles ?? this.videoFiles,
      imageFiles: imageFiles ?? this.imageFiles,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      // userReviews: userReviews ?? this.userReviews,
    );
  }
}
