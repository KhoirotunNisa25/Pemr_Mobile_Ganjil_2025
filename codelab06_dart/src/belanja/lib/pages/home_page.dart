import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
  Item(
    name: 'Sugar',
    price: 5000,
    photo: 'assets/images/sugar.jpg',
    stock: 12,
    rating: 4.5,
    description: 'Gula pasir berkualitas tinggi, cocok untuk kebutuhan sehari-hari.',
  ),
  Item(
    name: 'Salt',
    price: 2000,
    photo: 'assets/images/salt.jpg',
    stock: 25,
    rating: 4.2,
    description: 'Garam dapur murni, ideal untuk memasak dan pengawetan makanan.',
  ),
  Item(
    name: 'Milk',
    price: 10000,
    photo: 'assets/images/milk.jpg',
    stock: 10,
    rating: 4.8,
    description: 'Susu segar berkualitas tinggi, kaya akan kalsium dan nutrisi.',
  ),
  Item(
    name: 'Rice',
    price: 12000,
    photo: 'assets/images/rice.jpg',
    stock: 50,
    rating: 4.6,
    description: 'Beras premium dengan tekstur pulen dan aroma harum.',
  ),
  Item(
    name: 'Cooking Oil',
    price: 15000,
    photo: 'assets/images/oil.jpg',
    stock: 20,
    rating: 4.4,
    description: 'Minyak goreng berkualitas tinggi, jernih dan tahan panas.',
  ),
  Item(
    name: 'Coffee',
    price: 25000,
    photo: 'assets/images/coffee.jpg',
    stock: 18,
    rating: 4.9,
    description: 'Kopi bubuk pilihan dengan aroma khas dan rasa kuat.',
  ),
  Item(
    name: 'Tea',
    price: 8000,
    photo: 'assets/images/tea.jpg',
    stock: 30,
    rating: 4.3,
    description: 'Teh hitam berkualitas tinggi dengan cita rasa khas dan menyegarkan.',
  ),
  Item(
    name: 'Flour',
    price: 7000,
    photo: 'assets/images/flour.jpg',
    stock: 15,
    rating: 4.1,
    description: 'Tepung terigu serbaguna untuk berbagai kebutuhan masakan.',
  ),
  Item(
    name: 'Butter',
    price: 18000,
    photo: 'assets/images/butter.jpg',
    stock: 8,
    rating: 5.0,
    description: 'Mentega lembut berkualitas premium untuk kue dan masakan.',
  ),
  Item(
    name: 'Eggs',
    price: 2500,
    photo: 'assets/images/eggs.jpg',
    stock: 60,
    rating: 3.0,
    description: 'Telur ayam segar, sumber protein tinggi untuk kebutuhan harian.',
  ),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Khoirotun Nisa - 2341720057'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.name,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(item.photo, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('Rp ${item.price}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [   
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text('${item.rating}'),
                              ],
                            ),
                            Text('Stok: ${item.stock}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Khoirotun Nisa - 2341720057',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
