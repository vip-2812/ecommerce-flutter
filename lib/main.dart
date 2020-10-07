import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/pages/core/app.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(App());
}
