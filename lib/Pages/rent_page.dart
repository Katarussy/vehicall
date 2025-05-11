import 'package:vehicall/model/car.dart';
import 'package:vehicall/model/car_tile.dart';
import 'package:vehicall/model/fav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  void addCarToFav(Car car) {
    Provider.of<Fav>(context, listen: false).addItemToCart(car);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Successfully Added!'),
            content: Text('Check your Favorites'),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Fav>(
      builder:
          (context, value, child) => Column(
            children: [
              //search bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search Here...',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Avaialable Cars',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    Text(
                      'See All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Car car = value.getCarlist()[index];
                    return CarTile(car: car, onTap: () => addCarToFav(car));
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                child: Divider(color: Colors.white),
              ),
            ],
          ),
    );
  }
}
