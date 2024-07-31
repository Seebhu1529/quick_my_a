// Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Screen UI Provider
import '/firebase_options.dart';
import '/pages/sign_up.dart';
import 'pages/Cart_Page.dart';
import 'pages/Notification_Page.dart';
import 'pages/sign_in.dart';
import '/pages/HomePage.dart';
import '/pages/favourite.dart';
import '/theme.dart';

void main() async {
  /// [Google Fonts License]
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  /// [Firebase] Initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await Hive.openBox('userData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rigel Moble App',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.buildTheme(Brightness.light),
      routes: {
        // '/': (BuildContext context) => const FavouriteScreen(),
        '/signIn': (BuildContext context) => const SignInScreen(),
        '/signUp': (BuildContext context) => const SignUpScreen(),
        '/home': (BuildContext context) => HomePage(),
        '/favourite': (BuildContext context) => const FavouriteScreen(),
        'Notification': (BuildContext context) => const NotificationPage(),
        'Cartpage': (BuildContext context) => const CartPage(),
      },
      home: HomePage(),
    );
  }
}
