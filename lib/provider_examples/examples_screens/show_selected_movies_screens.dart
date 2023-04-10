import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class ShowSelectedMoviesScreen extends StatelessWidget {
  const ShowSelectedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<MovieProvider>().favList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Movies'),
      ),
      body: ListView.builder(
        itemCount: fav.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Movie ${fav[index]}'),
            trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removeFav(fav[index]);
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )),
          );
        },
      ),
    );
  }
}
