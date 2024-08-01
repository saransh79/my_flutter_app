class UnsplashImage {
  final String imageUrl;

  const UnsplashImage({required this.imageUrl});

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return UnsplashImage(imageUrl: json['urls']['regular']);
  }
}
