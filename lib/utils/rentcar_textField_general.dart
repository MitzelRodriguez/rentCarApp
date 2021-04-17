import 'package:flutter/material.dart';

class RentCarTextFieldGeneral extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final String labelText;
  final Icon prefixIcon;
  final Function validator;

  const RentCarTextFieldGeneral({
    @required this.textController,
    @required this.hintText,
    @required this.labelText,
    @required this.prefixIcon,
    @required this.validator,
    icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.white,
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            controller: textController,
            maxLength: 80,
            maxLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              border: InputBorder.none,
              counterText: '',
              labelText: labelText,
            ),
            validator: validator,
          ),
        ),
      );

// Container(
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.all(
//       Radius.circular(20),
//     ),
//     color: Colors.white,
//     border: Border.all(color: Colors.blueAccent),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.only(left: 10.0),
//     child: TextFormField(
//       controller: this._passController,
//       maxLines: 1,
//       autofocus: false,
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         prefixIcon: Icon(
//

//         ),
//         border: InputBorder.none,
//       ),
//     ),
//   ),
// );
}
