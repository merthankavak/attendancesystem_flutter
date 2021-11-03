import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();
  final onBoard1SVG = 'onBoard1'.toSVG;
  final loginSVG = 'login'.toSVG;
}
