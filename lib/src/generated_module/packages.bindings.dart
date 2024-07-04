// flutterVersion = '3.16.5'
// dartVersion = '3.2.3'
// widgetCount = 0
// apiCount = 0
// ignore_for_file: unused_import, unnecessary_import, implementation_imports, unused_shown_name, deprecated_member_use, prefer_single_quotes, unused_element, unused_field, duplicate_import, prefer_const_constructors, invalid_use_of_visible_for_testing_member

import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

int _kDefaultSemanticIndexCallback(Widget _, int localIndex) => localIndex;
Widget _defaultBuildAnimation(
  BuildContext context,
  Widget child,
  AnimationController controller,
  double percent,
) {
  return Opacity(opacity: percent, child: child);
}

const Duration _defaultDuration = Duration(milliseconds: 2300);
const Duration _defaultAnimDuration = Duration(milliseconds: 250);
const Color _defaultBackgroundColor = Color(0xDD000000);

const String flutterVersion = '3.16.5';
const String dartVersion = '3.2.3';
const int widgetCount = 0;
const int apiCount = 0;

/// packagesComponents
Map<String, dynamic> packagesComponents = {};

/// packagesMapping
Map<String, bool> packagesMapping = {};
