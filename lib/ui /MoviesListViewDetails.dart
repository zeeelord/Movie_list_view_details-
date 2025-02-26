// NEW ROUTE OR PAGE
import 'package:flutter/material.dart';

import 'package:listof_view_movies/model/movie.dart';

class Movie_ListView_Details extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const Movie_ListView_Details(
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
          MovieDetailsHeaderWithPoster(movie: movie),
          MovieDetailCast(movie: movie)
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
          MoviePoster(poster: movie.images[0].toString()),
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
  final String poster;
  const MoviePoster({
    super.key,
    required this.poster,
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
                DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover),
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

class MovieDetailCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.actor),
          MovieField(field: "actor", value: movie.director),
          MovieField(field: "awards", value: movie.awards),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field: ",
          style: const TextStyle(
              color: Colors.black38, fontSize: 12, fontWeight: FontWeight.w300),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
