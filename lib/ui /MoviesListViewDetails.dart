// NEW ROUTE OR PAGE
import 'package:flutter/material.dart';

import 'package:listof_view_movies/model/movie.dart';

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails(
      {super.key, required this.movieName, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies", style: mainTextStyle()),
        centerTitle: false,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie)
        ],
      ),
    );
  }

  TextStyle mainTextStyle() {
    return const TextStyle(
        fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255));
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({
    super.key,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            const Icon(Icons.play_circle_outline,
                color: Colors.white, size: 100)
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(Poster: movie.images[0].toString()),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String Poster;
  const MoviePoster({
    super.key,
    required this.Poster,
  });

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(Poster), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year}. ${movie.genre}".toUpperCase(),
          style:
              const TextStyle(fontWeight: FontWeight.w400, color: Colors.cyan),
        ),
        Text(
          movie.title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
        ),
        Text.rich(
          TextSpan(
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              children: <TextSpan>[
                TextSpan(text: movie.plot),
                const TextSpan(
                    text: "More...",
                    style: TextStyle(color: Colors.indigoAccent))
              ]),
        )
      ],
    );
  }
}
