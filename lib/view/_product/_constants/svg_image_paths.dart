import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();
  final faceSVG = 'face'.toSVG;
  final classSVG = 'class'.toSVG;
  final teacherSVG = 'teacher'.toSVG;
  final loginSVG = 'login'.toSVG;
}
