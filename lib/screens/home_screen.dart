import 'package:flutter/material.dart';
import 'package:pelis/providers/movies_provider.dart';
import 'package:pelis/search/search_delegate.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cine'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: Icon(Icons.search_outlined)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares!',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
