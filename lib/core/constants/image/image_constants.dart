class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._init();
  }

  ImageConstants._init();
  String get projeIcon => toPng('attendancesystem_icon');
  String toPng(String name) => 'asset/image/$name.png';
}
