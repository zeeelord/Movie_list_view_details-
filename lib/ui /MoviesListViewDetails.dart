// ignore_for_file: file_ names

import 'package:flutter/material.dart';
import 'package:listof_view_movies/model/movie.dart';

// ignore: camel_case_types
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
          const Horizontal_line(),
          MovieDetailsCast(movie: movie),
          const Horizontal_line(),
          Movie_extra_Poster(posters: movie.images)
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
              height: 170,
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
  // ignore: prefer_typing_uninitialized_variables
  final poster;
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
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
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

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.actor),
          MovieField(field: "Directors", value: movie.director),
          MovieField(field: "Awards", value: movie.awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  // ignore: prefer_typing_uninitialized_variables
  final value;
  const MovieField({super.key, required this.field, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$field : ",
          style: const TextStyle(
              color: Colors.black38, fontSize: 12, fontWeight: FontWeight.w400),
        ),
        Expanded(
          child: Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        )
      ],
    );
  }
}

// ignore: camel_case_types
class Horizontal_line extends StatelessWidget {
  const Horizontal_line({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Container(height: 0.5, color: Colors.grey),
    );
  }
}

// ignore: camel_case_types
class Movie_extra_Poster extends StatelessWidget {
  final posters;
  const Movie_extra_Poster({super.key, required this.posters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text("more movie posters".toUpperCase(),
              style: const TextStyle(fontSize: 14, color: Colors.black26)),
        ),
        SizedBox(
            height: 170,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(posters[index]),
                                fit: BoxFit.cover)),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: posters.length))
      ],
    );
  }
}
