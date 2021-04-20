import 'package:flutter/material.dart';

//SCREEN
import 'package:rent_car_app/src/utils/rentcar_colors.dart';

class RentCarBttonGeneral extends StatelessWidget {
  final Function onTap;
  final String title;
  final Color color;

  const RentCarBttonGeneral({
    @required this.onTap,
    @required this.title,
    this.color = RentcarColors.blueColor,
  });

  @override
  Widget build(BuildContext context) => RaisedButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: color,
        onPressed: onTap,
        elevation: 5,
        child: Text(
          (title),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      );
}
