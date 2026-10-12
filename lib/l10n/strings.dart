import 'package:flutter/widgets.dart';
import 'app_controller.dart';

/// Tutte le stringhe dell'interfaccia, localizzate IT / EN.
/// I testi provengono dal portfolio originale mathieugorelli.myportfolio.com.
class Strings {
  final bool it;
  const Strings(String lang) : it = lang == 'it';

  /// Helper: sceglie tra italiano [i] e inglese [e].
  String pick(String i, String e) => it ? i : e;

  static Strings of(BuildContext context) =>
      Strings(AppScope.of(context).locale.languageCode);

  // --- Navigazione ---
  String get navPortfolio => 'Portfolio';
  String get navSound => 'The Sound of Graphite';
  String get navPrints => 'Prints';
  String get navProjects => pick('Altri progetti', 'Other projects');
  String get navAbout => pick('About me', 'About me');
  String get navVideo => 'Video';
  String get navContact => pick('Contatti', 'Contact');

  // --- Home / Hero ---
  String get heroTitle => 'Mathieu Gorelli';
  String get heroSubtitle => pick('Grafite su carta', 'Graphite on paper');
  String get heroTagline => pick(
        'Poche opere, studiate con attenzione. La cura e il tempo prima di tutto.',
        'A few works, carefully studied. Care and time above all.',
      );
  String get heroCta => pick('Esplora le opere', 'Explore the works');

  // --- Etichette comuni ---
  String get selectedWorks => pick('Opere selezionate', 'Selected works');
  String get viewWork => pick('Vedi opera', 'View work');
  String get back => pick('Indietro', 'Back');
  String get allWorks => pick('Tutte le opere', 'All works');
  String get technique => pick('Tecnica', 'Technique');
  String get year => pick('Anno', 'Year');
  String get imageComingSoon =>
      pick('Immagine in arrivo', 'Image coming soon');

  // --- The Sound of Graphite (statement originale) ---
  String get soundTitle => 'The Sound of Graphite';
  List<String> get soundBody => it
      ? const [
          '"The Sound of Graphite" riflette principalmente su due concetti distinti: ascoltare e rallentare.',
          'Oltre al disegno, una mia grande passione è la musica: quando creo, quando ho bisogno di concentrarmi, in quasi ogni ambito della mia vita c\'è sempre una sinfonia in sottofondo. Ho sempre cercato un modo per unire questi due mondi e, grazie a questo progetto e al fortunato incontro con Fosco, finalmente mi si presenta l\'occasione.',
          '"Rallentare", invece, è il secondo tema della mostra: in un mondo sempre più veloce in cui le persone creano contenuti per riempire gli occhi delle persone, mi piacerebbe invitare i visitatori della mia mostra a ritagliarsi una parentesi di tempo in cui poter staccare dalla frenesia quotidiana e riprendersi il tempo che ogni giorno scivola via.',
          'Il mio lavoro richiede un\'immensa quantità di tempo e vorrei sottolineare l\'importanza che ha per me presentando poche opere ma studiate con attenzione: il mio obiettivo non è riempire gli occhi della gente ma presentare ciò che sono, mostrando la cura e l\'attenzione che metto nelle mie creazioni.',
        ]
      : const [
          '"The Sound of Graphite" reflects mainly on two distinct ideas: to listen and to slow down.',
          'Besides drawing, one of my great passions is music: when I create, when I need to focus, in almost every part of my life there is always a symphony in the background. I have always looked for a way to bring these two worlds together and, thanks to this project and my fortunate meeting with Fosco, the chance has finally arrived.',
          '"Slowing down" is the second theme of the exhibition: in an ever faster world where people create content to fill other people\'s eyes, I would like to invite the visitors of my exhibition to carve out a parenthesis of time — to step away from the daily rush and reclaim the time that slips away each day.',
          'My work requires an immense amount of time, and I want to underline its importance by presenting few works, but carefully studied: my goal is not to fill people\'s eyes, but to present who I am, showing the care and attention I put into my creations.',
        ];

  // --- Prints ---
  String get printsTitle => 'Prints';
  String get printsBody => pick(
        'Al momento questa sezione è in lavorazione, mi scuso per il disagio.',
        'This section is currently being updated, apologies for the inconvenience.',
      );
  String get printsCta =>
      pick('Contattare per informazioni', 'Contact for information');

  // --- Altri progetti ---
  String get projectsTitle => pick('Altri progetti', 'Other projects');
  String get projectsIntro => pick(
        'Murales, copertine e collaborazioni oltre ai lavori a grafite.',
        'Murals, album covers and collaborations beyond the graphite works.',
      );

  // --- About me ---
  String get aboutTitle => pick('About me', 'About me');
  List<String> get aboutBody => it
      ? const [
          'Mathieu Gorelli è un artista visivo concettuale che utilizza l\'iperrealismo come mezzo espressivo, lavorando esclusivamente con la grafite.',
          'Dal 2018 ha trovato nel disegno un modo per dare forma a sentimenti ed emozioni inesprimibili a parole. Uno degli artisti che ha influenzato maggiormente il suo percorso è Jono Dry, specializzato nel disegno iperrealista e surrealista, fonte di ispirazione della prima opera: "Solitude II".',
          'Ha esposto nella chiesa sconsacrata di San Grato ad Aosta e al Castello di Saint-Rhémy-en-Bosses con la curatela di Alessandro Parrella.',
          'Nel 2025 è stato selezionato per mostre collettive a Torino con l\'associazione Artàporter, a Venezia per lo Yicca Prize 2025 e a Milano come finalista del Premio Arte 2025, pubblicato sull\'omonima rivista nei mesi di settembre, ottobre e novembre.',
          'Nello stesso anno una delle sue opere, Vuoto, ha trovato casa presso l\'Osservatorio Astronomico della Regione Autonoma Valle d\'Aosta ed è stata esposta a Milano.',
          'Nel 2026 ha esposto a Finalborgo nella sede di Fattoamanofinalborgo e ha presentato il suo primo progetto "The sound of graphite" al Planetario di Lignan in occasione del 34° Star Party.',
        ]
      : const [
          'Mathieu Gorelli is a conceptual visual artist who works exclusively in graphite, using hyperrealism as his medium of expression.',
          'Since 2018, he has found in drawing a way to capture feelings and emotions that cannot be described in words. One of the artists who has most influenced his journey is Jono Dry, specialising in hyperrealist and surrealist drawing, who inspired his first work: "Solitude II".',
          'He has exhibited in the deconsecrated church of San Grato in Aosta and at the Castle of Saint-Rhémy-en-Bosses, curated by Alessandro Parrella.',
          'In 2025 he was selected for group exhibitions in Turin with the Artàporter association, in Venice for the Yicca Prize 2025, and in Milan as a finalist for the Premio Arte 2025, featured in the related magazine in September, October and November.',
          'In the same year one of his works, Vuoto, found a home at the Astronomical Observatory of the Autonomous Region of Aosta Valley and was exhibited in Milan.',
          'In 2026 he exhibited at Fattoamanofinalborgo in Finalborgo and presented his first project "The sound of graphite" at the Lignan Planetarium during the 34th Star Party.',
        ];
  String get pressTitle => pick('Premi & stampa', 'Awards & press');

  // --- Video ---
  String get videoTitle => 'Video';
  String get videoBody => pick(
        'Guarda i video e i timelapse delle opere sul canale YouTube.',
        'Watch videos and work timelapses on the YouTube channel.',
      );
  String get videoCta => pick('Apri il canale YouTube', 'Open the YouTube channel');

  // --- Contatti ---
  String get contactTitle => pick('Contatti', 'Contact');
  String get contactTagline => pick(
        'Hai qualche domanda? Hai un progetto da propormi? Scrivimi!',
        'Have a question? Have a project to propose? Get in touch!',
      );
  String get contactEmail => pick('Scrivi una email', 'Send an email');
  String get contactWhatsapp => 'WhatsApp';
  String get contactFollow => pick('Seguimi', 'Follow me');

  // --- Footer ---
  String get rights => pick('Tutti i diritti riservati', 'All rights reserved');
  String get footerLaw => 'Law n. 63 of 22 April 1941';

  // --- Lingua ---
  String get langLabel => it ? 'IT' : 'EN';
  String get otherLangLabel => it ? 'EN' : 'IT';
}
