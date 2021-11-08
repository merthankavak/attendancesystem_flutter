import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'course_view_model.g.dart';

class CourseViewModel = _CourseViewModelBase with _$CourseViewModel;

abstract class _CourseViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
