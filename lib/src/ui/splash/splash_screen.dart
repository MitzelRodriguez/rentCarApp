import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//SCREENS
import 'package:rent_car_app/src/utils/rentcar_colors.dart';
import 'package:rent_car_app/src/utils/rentcar_rutes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  void _startAnimate() {
    this._animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
        lowerBound: 0.6,
        upperBound: 1.0);
    this._animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    this._animationController.repeat(reverse: true);
  }

  void _goToScreen({
    @required String route,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();

    this._startAnimate();

    Future.delayed(
      Duration(seconds: 3),
      () async {
        this._goToScreen(
          route: RentCarRoutes.LOGIN_SCREEN,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RentcarColors.VERTICAL_GRADIENT,
        ),
        child: Center(
          child: ScaleTransition(
            scale: this._animation,
            child: Image.asset(
              'assets/rent.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    this._animationController.dispose();
    super.dispose();
  }
}
