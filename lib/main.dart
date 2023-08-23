import 'package:flutter/material.dart';
import 'package:user_app/user_app.dart';
import 'injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const UserApp());
}
