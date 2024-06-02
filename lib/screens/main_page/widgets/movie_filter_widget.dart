import 'package:flutter/material.dart';
import 'package:flutter_movie_listing_app/constants/enums.dart';

class MovieFilterWidget extends StatelessWidget {
  MovieFilterWidget({super.key, required this.selectedGenre, required this.genreList, required this.onGenreChanged});

  final Genre selectedGenre;
  final List<Genre> genreList;
  final Function(Genre? genre) onGenreChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Genre>(
      isExpanded: true,
      value: selectedGenre,
      onChanged: onGenreChanged,
      items: genreList.map((Genre genre) {
        return DropdownMenuItem<Genre>(
          value: genre,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8,),
              child: Text(genre.name)),
        );
      }).toList(),
    );
  }
}
