class Movie {
  final int? id;
  final String title;
  final int duration;
  final String plot;
  final int year;

  Movie({
    this.id,
    required this.title,
    required this.duration,
    required this.plot,
    required this.year,
  });

  //* metodo per convertire oggetto Dart in Map
  Map<String, dynamic> toMap() {
    final map = {
      'title': title,
      'duration': duration,
      'plot': plot,
      'year': year,
    };
    if (id != null) {
      map['id'] = id as Object;
    }
    return map;
  }

  //* metodo per convertire da map a oggetto Dart
  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      duration: map['duration'],
      plot: map['plot'],
      year: map['year'],
    );
  }
}
