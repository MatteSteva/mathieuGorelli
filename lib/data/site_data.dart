/// Contatti, social e progetti — dati statici dal portfolio originale.
library;

class Contacts {
  static const email = 'mathieu.gorelli@gmail.com';
  static const whatsapp = 'https://wa.me/3450238676';
  static const instagram = 'https://www.instagram.com/mathieu.gorelli/';
  static const facebook = 'https://www.facebook.com/mathieu.gorelli/?locale=it_IT';
  static const youtube = 'https://www.youtube.com/@mathieu.gorelli';
  static const youtubeChannel =
      'https://www.youtube.com/channel/UCwKOlFl1YG2vm-AjWiIZQKA';
  static const etsy = 'https://www.etsy.com/it/shop/MathieuGorelli';
}

class SocialLink {
  final String label;
  final String url;
  const SocialLink(this.label, this.url);
}

const List<SocialLink> kSocials = [
  SocialLink('Instagram', Contacts.instagram),
  SocialLink('YouTube', Contacts.youtube),
  SocialLink('Facebook', Contacts.facebook),
  SocialLink('Etsy', Contacts.etsy),
];

/// Progetti extra (murales, copertine, collaborazioni).
class Project {
  final String title;
  final int year;
  const Project(this.title, this.year);
}

const List<Project> kProjects = [
  Project('LUX', 2026),
  Project('Murales', 2025),
  Project('The Valdostaner', 2023),
  Project('Spino e i Mostri di Lagoprofondo', 2022),
  Project('4 del mattino', 2020),
];

/// Anteprime shop (Etsy / prints).
const List<String> kShopImages = [
  'assets/shop/shop1.png',
  'assets/shop/shop2.png',
  'assets/shop/shop3.png',
];

/// Premi & stampa (selezione dal portfolio originale).
class PressItem {
  final String title;
  final int year;
  const PressItem(this.title, this.year);
}

const List<PressItem> kPress = [
  PressItem('Beautiful Bizarre Art Prize — entries', 2026),
  PressItem('Premio Arte 2025 — Catalogo dell\'Arte Moderna', 2026),
  PressItem('Un murales per Saint-Vincent', 2025),
  PressItem('Yicca Prize 2025 (Artribune)', 2025),
  PressItem('Un\'opera d\'arte al planetario di Lignan (PlanIT)', 2025),
  PressItem('Artàporter', 2025),
  PressItem('ORSOFF 2025', 2025),
  PressItem('Coincidenze d\'Artista', 2024),
  PressItem('SUM ERGO CREO (ANSA.it)', 2023),
  PressItem('1° concorso artistico (Associazione Alfa)', 2021),
];
