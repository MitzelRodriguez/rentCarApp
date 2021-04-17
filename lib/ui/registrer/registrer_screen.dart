import 'package:flutter/material.dart';
import 'package:rent_car_app/utils/rentcar_btton_general.dart';
import 'package:rent_car_app/utils/rentcar_colors.dart';
import 'package:rent_car_app/utils/rentcar_rutes.dart';
import 'package:rent_car_app/utils/rentcar_textField_general.dart';

class RegistrerScreen extends StatefulWidget {
  @override
  _RegistrerScreenState createState() => _RegistrerScreenState();
}

class _RegistrerScreenState extends State<RegistrerScreen> {
  //Controllers
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
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
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                          gradient: RentcarColors.VERTICAL_GRADIENT,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(250, 70),
                          ),
                        ),
                        child: this._buildLogo(),
                      ),
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
          padding: const EdgeInsets.all(20),
          child: Form(
            key: this._formGlobalKey,
            child: Column(
              children: [
                this._buildFirstName(),
                this._buildSpace(),
                this._buildSecondName(),
                this._buildSpace(),
                this._buildInputEmail(),
                this._buildSpace(),
                this._buildInputPassword(),
                this._buildSpace(),
                this._buildSpace(),
                this._buildEnterButton(),
                this._buildSpace(),
                this._buildTextLink(
                  title: 'Ya tengo Cuenta',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RentCarRoutes.LOGIN_SCREEN,
                    );
                  },
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildSpace() => const SizedBox(
        height: 20,
      );

  Widget _buildFirstName() => RentCarTextFieldGeneral(
        textController: _firstNameController,
        hintText: 'Ingresa tu Nombre o Nombres',
        labelText: 'Nombre',
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.blueAccent,
        ),
        validator: null,
      );

  Widget _buildSecondName() => RentCarTextFieldGeneral(
        textController: _secondNameController,
        hintText: 'Ingresa tus apellidos',
        labelText: 'Apellidos',
        prefixIcon: Icon(
          Icons.account_circle,
          color: Colors.blueAccent,
        ),
        validator: null,
      );

  Widget _buildInputEmail() => RentCarTextFieldGeneral(
        textController: _emailController,
        hintText: 'Ingresa tu email',
        labelText: 'Email',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.blueAccent,
        ),
        validator: null,
      );

  Widget _buildInputPassword() => RentCarTextFieldGeneral(
        textController: _passController,
        hintText: 'Ingresa tu password',
        labelText: 'Password',
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: Colors.blueAccent,
        ),
        validator: null,
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

  Widget _buildEnterButton() => RentCarBttonGeneral(
        onTap: () {},
        title: 'Registrarme',
      );
}
