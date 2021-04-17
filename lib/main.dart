import 'package:flutter/material.dart';
import 'package:rent_car_app/ui/login/login_screen.dart';

//Screens
import 'package:rent_car_app/ui/splash/splash_screen.dart';

//Routes
import 'package:rent_car_app/utils/rentcar_rutes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _key = UniqueKey();
  final _navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: this._key,
      navigatorKey: this._navigatorKey,
      title: 'Rent Car',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RentCarRoutes.SPLASH_SCREEN,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RentCarRoutes.SPLASH_SCREEN:
            return this._slideTransition(
              settings: settings,
              pageBuilder: (context, _, __) => SplashScreen(),
            );
          case RentCarRoutes.LOGIN_SCREEN:
            return this._slideTransition(
              settings: settings,
              pageBuilder: (context, _, __) => LoginScreen(),
            );
          default:
            throw Exception('Ruta Invalida');
        }
      },
    );
  }

//TRANSITIONS
  PageRouteBuilder _slideTransition({
    @required RouteSettings settings,
    @required
        Widget Function(BuildContext, Animation<double>, Animation<double>)
            pageBuilder,
  }) =>
      PageRouteBuilder(
        opaque: false,
        pageBuilder: pageBuilder,
        settings: settings,
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );

  PageRouteBuilder _modalTransition({
    @required RouteSettings settings,
    @required
        Widget Function(BuildContext, Animation<double>, Animation<double>)
            pageBuilder,
    bool opaque = false,
  }) =>
      PageRouteBuilder(
        opaque: opaque,
        pageBuilder: pageBuilder,
        settings: settings,
        transitionsBuilder: (_, animation, __, child) {
          final tween = Tween(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          );
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  PageRouteBuilder _fadeTransition({
    @required RouteSettings settings,
    @required
        Widget Function(BuildContext, Animation<double>, Animation<double>)
            pageBuilder,
  }) =>
      PageRouteBuilder(
        pageBuilder: pageBuilder,
        settings: settings,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            child: child,
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
            ),
          );
        },
      );
}
