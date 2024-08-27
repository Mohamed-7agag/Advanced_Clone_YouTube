import 'package:flutter/material.dart';

import 'package:advanced_youtube/Core/utils/service_locator.dart';
import 'package:advanced_youtube/cache/cache_helper.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setUp();

  runApp(const MyApp());
}
