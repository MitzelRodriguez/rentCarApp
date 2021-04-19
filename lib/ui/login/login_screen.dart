import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rent_car_app/utils/rentcar_btton_general.dart';

//UTILS
import 'package:rent_car_app/utils/rentcar_colors.dart';
import 'package:rent_car_app/utils/rentcar_rutes.dart';
import 'package:rent_car_app/utils/rentcar_textField_general.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                            gradient: RentcarColors.VERTICAL_GRADIENT,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(250, 70),
                            )),
                        child: this._buildLogo(),
                      ),
                      this._buildSpace(),
                      this._buildForm(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo() => Center(
        child: Image.asset(
          'assets/rent-a-car.png',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildForm() => Expanded(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Form(
            key: this._formGlobalKey,
            child: Column(
              children: [
                this._buildInputEmail(),
                this._buildSpace(),
                this._buildInputPassword(),
                this._buildSpace(),
                this._buildSpace(),
                this._buildTextLink(
                  title: 'Olvidaste tu password?',
                  onTap: () {},
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                this._buildSpace(),
                this._buildTextLink(
                  title: 'Crear Cuenta',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RentCarRoutes.REGISTRER_SCREEN,
                    );
                  },
                ),
                this._buildSpace(),
                this._buildSpace(),
                this._buildEnterButton(),
              ],
            ),
          ),
        ),
      );

  Widget _buildInputEmail() => RentCarTextFieldGeneral(
        textController: this._emailController,
        hintText: 'Ingresa tu email',
        labelText: 'Email',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.blueAccent,
        ),
        validator: null,
      );

  Widget _buildInputPassword() => RentCarTextFieldGeneral(
        textController: this._passController,
        hintText: 'Ingresa tu Password',
        labelText: 'Password',
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: Colors.blueAccent,
        ),
        validator: null,
      );

  Widget _buildEnterButton() => RentCarBttonGeneral(
        onTap: () {
          Navigator.pushNamed(context, RentCarRoutes.HOME_SCREEN);
        },
        title: 'Iniciar Sesion',
      );

  Widget _buildSpace() => const SizedBox(
        height: 20.0,
      );

  Widget _buildTextLink({
    @required String title,
    @required Function onTap,
    @required TextStyle style,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Colors.black,
              ),
            ),
          ),
          child: Text(
            title,
            style: style,
          ),
        ),
      );
}
