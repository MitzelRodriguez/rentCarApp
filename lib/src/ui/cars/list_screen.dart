import 'package:flutter/material.dart';
import 'package:rent_car_app/src/models/list_details.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _controller,
        itemCount: cars.length,
        itemBuilder: (context, index) {
          double currentPage = 0;

          try {
            currentPage = _controller.page;
          } catch (_) {}

          final resizeFactor =
              (1 - (((currentPage - index).abs() * 0.3).clamp(0.0, 1.0)));

          final currentCar = cars[index];

          return Container();
        },
      ),
    );
  }
}

/*
class CarsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          'assets/imagenBack.png',
          height: size.height,
          width: size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                this._buildTitle(),
                SizedBox(
                  height: 40,
                ),
                this._buildBttn(
                  color: Colors.green,
                  tittle: 'Carro con Conductor',
                  image: Image.asset(
                    'assets/driver.png',
                    height: 50,
                    width: 50,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                this._buildBttn(
                  color: Colors.lightBlue,
                  tittle: 'Solo Carro',
                  image: Image.asset(
                    'assets/car.png',
                    height: 50,
                    width: 50,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() => Padding(
        padding: const EdgeInsets.only(
          top: 120,
        ),
        child: Center(
          child: Text(
            'TIPO DE RENTA',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
      );

  Widget _buildBttn({
    @required Color color,
    @required String tittle,
    @required Image image,
    @required Function onPressed,
  }) =>
      Container(
        child: MaterialButton(
          color: color,
          minWidth: 300,
          height: 100,
          child: Column(
            children: [
              image,
              SizedBox(
                height: 10,
              ),
              Text(
                tittle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          onPressed: onPressed,
        ),
      );
}
*/
