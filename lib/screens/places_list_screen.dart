import 'package:flutter/material.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child:
            const Center(child: Text('Got no places yet, start adding some!')),
        builder: (ctx, greatPlace, ch) => greatPlace.items.isEmpty
            ? ch!
            : ListView.builder(
                itemCount: greatPlace.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlace.items[i].image!,
                    ),
                  ),
                  title: Text(greatPlace.items[i].title!),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
