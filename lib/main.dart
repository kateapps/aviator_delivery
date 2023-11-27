import 'package:aviator_delivery/constants/app_colors.dart';
import 'package:aviator_delivery/util/app_routes.dart';
import 'package:aviator_delivery/views/category/view/categories_screen.dart';
import 'package:aviator_delivery/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.welcome,
    );
  }
}
