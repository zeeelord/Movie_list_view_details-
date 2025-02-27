import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:listof_view_movies/model/movie.dart';

// ignore: unused_import
import 'MoviesListViewDetails.dart';

class MovieListView extends StatelessWidget {
  MovieListView({super.key});
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Inception",
    "The Dark Knight",
    "Interstellar",
    "Parasite",
    "The Matrix",
    "Fight Club",
    "The Godfather",
    "Pulp Fiction",
    "Avengers: Endgame",
    "Inception",
    "The Dark Knight",
    "Interstellar",
    "Parasite",
    "The Matrix",
    "Fight Club",
    "The Godfather",
    "Pulp Fiction",
    "Avengers: Endgame",
    "Avengers: Endgame",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Movies",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey.shade900,
          centerTitle: false,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: ListView.builder(
            itemCount:
                movieList.length, // changed the length since list changed
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  movieCard(movieList[index], context),
                  Positioned(
                      top: 10, child: movieImage(movieList[index].images[0]))
                ],
              );

              /// make this active again to active previous mode

              // return  Card(
              //   elevation: 4.5,
              //   color: Colors.white,
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       child: Container(
              //         width: 200,
              //         height: 200,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: NetworkImage(movieList[index].images[0]),
              //             fit: BoxFit.cover
              //           ),
              //           borderRadius: BorderRadius.circular(13.0)
              //         ),
              //       ),
              //     ),
              //     trailing: const Text("..."),
              //     title: Text(movieList.elementAt(index).title),
              //     subtitle:  Text(movieList.elementAt(index).title),
              //    // onTap: ()=> debugPrint("Movie name: ${movies.elementAt(index)}"),
              //    onTap: (){
              //      Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieListViewDetails(movieName: movieList.elementAt(index).title,movie: movieList[index] ,)));
              //    }
              //   ),
              // );
            }));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        movie.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      )),
                      Text("Rating: ${movie.imdRating}/10",
                          style: mainTextStyle()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Released ${movie.released}",
                          style: mainTextStyle()),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(movie.rated, style: mainTextStyle())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        //navigating to next page
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    )))
      },
    );
  }

  Widget movieImage(String Imageurl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                // the "??" means if the image is not provided or if null use the next available element
                Imageurl ??
                    'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc2ODg0MzMzM15BMl5BanBnXkFtZTgwODYxODA5NTE@._V1_SY1000_SX1500_AL_.jpg',
              ),
              fit: BoxFit.cover)),
    );
  }

  TextStyle mainTextStyle() {
    return const TextStyle(color: Colors.grey);
  }
}
