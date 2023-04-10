import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import 'show_selected_movies_screens.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<MovieProvider>().favList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Movies: ${fav.length}'),
      ),
      body: ListView.builder(
        itemCount: 40,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Movie ${index + 1}'),
            trailing: GestureDetector(
              onTap: () {
                if (!fav.contains(index)) {
                  context.read<MovieProvider>().addToList(index);
                  print(fav);
                } else {
                  context.read<MovieProvider>().removeFav(index);
                }
              },
              child: Icon(
                Icons.favorite,
                color: fav.contains(index) ? Colors.red : Colors.grey,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ShowSelectedMoviesScreen(),
          ),
        );
      }),
    );
  }
}
