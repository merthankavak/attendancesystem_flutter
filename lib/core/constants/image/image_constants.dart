class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._init();
  }

  ImageConstants._init();
  String toPng(String name) => 'asset/image/$name.png';
}
