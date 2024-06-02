enum Genre {
  All,
  Action,
  Adventure,
  Animation,
  Comedy,
  Crime,
  Documentary,
  Drama,
  Family,
  Fantasy,
  History,
  Horror,
  Music,
  Mystery,
  Romance,
  ScienceFiction,
  TVMovie,
  Thriller,
  War,
  Western,
}

extension GenreExtension on Genre {
  int get id {
    switch (this) {
      case Genre.All:
        return -1;
      case Genre.Action:
        return 28;
      case Genre.Adventure:
        return 12;
      case Genre.Animation:
        return 16;
      case Genre.Comedy:
        return 35;
      case Genre.Crime:
        return 80;
      case Genre.Documentary:
        return 99;
      case Genre.Drama:
        return 18;
      case Genre.Family:
        return 10751;
      case Genre.Fantasy:
        return 14;
      case Genre.History:
        return 36;
      case Genre.Horror:
        return 27;
      case Genre.Music:
        return 10402;
      case Genre.Mystery:
        return 9648;
      case Genre.Romance:
        return 10749;
      case Genre.ScienceFiction:
        return 878;
      case Genre.TVMovie:
        return 10770;
      case Genre.Thriller:
        return 53;
      case Genre.War:
        return 10752;
      case Genre.Western:
        return 37;
      default:
        throw Exception("Invalid genre");
    }
  }

  String get name {
    switch (this) {
      case Genre.All:
        return "All";
      case Genre.Action:
        return "Action";
      case Genre.Adventure:
        return "Adventure";
      case Genre.Animation:
        return "Animation";
      case Genre.Comedy:
        return "Comedy";
      case Genre.Crime:
        return "Crime";
      case Genre.Documentary:
        return "Documentary";
      case Genre.Drama:
        return "Drama";
      case Genre.Family:
        return "Family";
      case Genre.Fantasy:
        return "Fantasy";
      case Genre.History:
        return "History";
      case Genre.Horror:
        return "Horror";
      case Genre.Music:
        return "Music";
      case Genre.Mystery:
        return "Mystery";
      case Genre.Romance:
        return "Romance";
      case Genre.ScienceFiction:
        return "Science Fiction";
      case Genre.TVMovie:
        return "TV Movie";
      case Genre.Thriller:
        return "Thriller";
      case Genre.War:
        return "War";
      case Genre.Western:
        return "Western";
      default:
        throw Exception("Invalid genre");
    }
  }
}
