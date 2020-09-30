class Plant {
  final String imageUrl;
  final String name;
  final String category;
  final String price;
  final String size;
  final String description;

  Plant({
    this.imageUrl,
    this.name,
    this.category,
    this.price,
    this.size,
    this.description,
  });
}

final List<Plant> plants = [
  Plant(
    imageUrl: 'assets/images/plant0.png',
    name: 'Aloe Vera',
    category: 'Outdoor',
    price: 'fdsfdsfsd',
    size: 'Small',
    description:
        'Aloe vera is a succulent plant species of the genus Aloe. It\'s medicinal uses and air purifying ability make it an awesome plant.',
  ),
  Plant(
    imageUrl: 'assets/images/plant1.png',
    name: 'Cool Plant',
    category: 'Indoor',
    price: 'fdfsdfsdfds',
    size: 'Medium',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur.',
  ),
  Plant(
    imageUrl: 'assets/images/plant2.png',
    name: 'Really Cool Plant',
    category: 'New Arrival',
    price: 'sdfdsfsdfsd',
    size: 'Large',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
  ),
];
