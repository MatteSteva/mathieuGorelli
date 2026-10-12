/// Modello di un'opera del portfolio.
class Work {
  final String slug;
  final String title;
  final int year;
  final String dimensions; // es. "80×60 cm ca."
  final String? asset; // percorso asset locale, se disponibile
  final List<String> notesIt;
  final List<String> notesEn;

  const Work({
    required this.slug,
    required this.title,
    required this.year,
    required this.dimensions,
    this.asset,
    this.notesIt = const [],
    this.notesEn = const [],
  });

  bool get hasImage => asset != null;

  String technique(bool it) => it ? 'Grafite su carta' : 'Graphite on paper';

  /// Riga descrittiva completa, es. "Grafite su carta · 80×60 cm ca."
  String caption(bool it) => '${technique(it)} · $dimensions';

  List<String> notes(bool it) => it ? notesIt : notesEn;
}

/// Opere in ordine di portfolio (dal più recente).
const List<Work> kWorks = [
  Work(
    slug: 'silenzio-1',
    title: 'Silenzio 1',
    year: 2026,
    dimensions: '80×60 cm ca.',
  ),
  Work(
    slug: 'quinto-movimento',
    title: 'Quinto movimento',
    year: 2026,
    dimensions: '60×50 cm ca.',
    asset: 'assets/works/quinto_movimento.jpg',
  ),
  Work(
    slug: 'essere',
    title: 'Essere',
    year: 2025,
    dimensions: '50×25 cm ca.',
    asset: 'assets/works/essere.jpg',
  ),
  Work(
    slug: 'vuoto',
    title: 'Vuoto',
    year: 2025,
    dimensions: '65×50 cm ca.',
    asset: 'assets/works/vuoto.png',
    notesIt: [
      'Opera finalista del Premio Arte 2025',
      'Omaggio al Planetario di Lignan (AO)',
      'Copia digitale in ciascun osservatorio italiano',
      'Copertina dell\'album "LUX" di Simone Léon Perron',
    ],
    notesEn: [
      'Finalist work at Premio Arte 2025',
      'Tribute to the Planetarium of Lignan (AO)',
      'Digital copy in every Italian observatory',
      'Cover of the album "LUX" by Simone Léon Perron',
    ],
  ),
  Work(
    slug: 'trama',
    title: 'Trama',
    year: 2023,
    dimensions: '65×50 cm ca.',
    asset: 'assets/works/trama.jpg',
  ),
  Work(
    slug: 'ossequio',
    title: 'Ossequio',
    year: 2023,
    dimensions: '65×50 cm ca.',
    asset: 'assets/works/ossequio.png',
    notesIt: ['Opera finalista allo Yicca Prize 2025'],
    notesEn: ['Finalist work at the Yicca Prize 2025'],
  ),
  Work(
    slug: 'deer-horn-study',
    title: 'Deer — horn study',
    year: 2023,
    dimensions: '20×20 cm ca.',
  ),
  Work(
    slug: 'van-allen',
    title: 'Van Allen',
    year: 2022,
    dimensions: '30×20 cm ca.',
  ),
  Work(
    slug: 'eye',
    title: 'Eye',
    year: 2022,
    dimensions: '10×10 cm ca.',
  ),
  Work(
    slug: 'blurred',
    title: 'Blurred',
    year: 2022,
    dimensions: '15×20 cm ca.',
  ),
  Work(
    slug: 'untitled-1',
    title: 'Untitled 1',
    year: 2022,
    dimensions: '20×20 cm ca.',
  ),
  Work(
    slug: 'home',
    title: 'Home',
    year: 2022,
    dimensions: '20×15 cm ca.',
    asset: 'assets/works/home.png',
  ),
  Work(
    slug: 'night',
    title: 'Night',
    year: 2022,
    dimensions: '20×15 cm ca.',
  ),
  Work(
    slug: 'solitude-ii',
    title: 'Solitude II',
    year: 2021,
    dimensions: '20×25 cm ca.',
  ),
];

Work? workBySlug(String slug) {
  for (final w in kWorks) {
    if (w.slug == slug) return w;
  }
  return null;
}
