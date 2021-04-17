import 'package:flutter/material.dart';
import 'package:rent_car_app/utils/rentcar_colors.dart';

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
        onPressed: onTap,
        child: Text(
          (title),
        ),
      );
}
