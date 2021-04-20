class Car {
  final image;
  final title;
  final description;
  final price;

  Car({
    this.image,
    this.title,
    this.description,
    this.price,
  });
}

final cars = <Car>[
  Car(
    image: '',
    title: 'Carro1',
    description: 'Carro tipo 1 estandar',
    price: '2000',
  ),
  Car(
    image: '',
    title: 'Carro2',
    description: 'Carro tipo 2 estandar',
    price: '20000',
  ),
  Car(
    image: '',
    title: 'Carro3',
    description: 'Carro tipo 3, cuatro puertas',
    price: '5000',
  ),
  Car(
    image: '',
    title: 'Carro4',
    description: 'Carro tipo 4 estandar',
    price: '4000',
  ),
];
