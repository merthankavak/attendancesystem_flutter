class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();
}
