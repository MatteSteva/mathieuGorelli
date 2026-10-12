# Mathieu Gorelli — Portfolio (Flutter Web)

Sito portfolio minimal e moderno, in **dark mode**, per l'artista Mathieu Gorelli
(disegnatore a grafite). Costruito con **Flutter Web**, bilingue **IT / EN**.
I testi provengono dal portfolio originale `mathieugorelli.myportfolio.com`.

## Avvio rapido

Dalla cartella del progetto:

```bash
flutter pub get
flutter run -d chrome
```

Se Flutter dice che la piattaforma web non è configurata, esegui una volta:

```bash
flutter create . --platforms=web
```

> ⚠️ `flutter create` potrebbe sovrascrivere `web/index.html`. Se succede,
> ripristina la versione presente in questo repo (contiene title, meta SEO,
> Open Graph e la schermata di caricamento).

## Build di produzione

```bash
flutter build web --release
```

L'output è in `build/web/`: caricalo su qualsiasi hosting statico
(Netlify, Vercel, GitHub Pages, Firebase Hosting…).

## Struttura

```
lib/
  main.dart                # entry point + MaterialApp.router
  router.dart              # rotte go_router
  theme/app_theme.dart     # palette dark + tipografia (serif + sans)
  l10n/
    app_controller.dart    # gestione lingua IT/EN (InheritedNotifier)
    strings.dart           # tutte le stringhe localizzate
  data/
    works.dart             # elenco opere (titolo, anno, dimensioni, note)
    site_data.dart         # contatti, social, progetti, premi/stampa
  pages/                   # Portfolio, dettaglio opera, Sound of Graphite,
                           # Prints, Altri progetti, About, Contatti
  widgets/                 # nav, footer, scheda opera, componenti comuni
assets/
  branding/  works/  shop/ # immagini
```

## Sezioni

- **Portfolio (Home)** — hero + griglia di tutte le opere; ogni opera ha una
  pagina di dettaglio con lightbox (zoom) e navigazione precedente/successiva.
- **The Sound of Graphite** — statement del progetto/mostra.
- **Prints** — sezione shop (in lavorazione) con link a Etsy.
- **Altri progetti** — murales, copertine, collaborazioni.
- **About me** — bio + elenco premi & stampa.
- **Video** — apre il canale YouTube.
- **Contatti** — email, WhatsApp e social.

## Come modificare i contenuti

- **Aggiungere/modificare un'opera:** `lib/data/works.dart`. Metti l'immagine in
  `assets/works/` e indica il percorso nel campo `asset`. Le opere senza immagine
  mostrano automaticamente un segnaposto elegante.
- **Testi e traduzioni:** `lib/l10n/strings.dart` (ogni voce ha versione IT ed EN).
- **Contatti, social, progetti, premi:** `lib/data/site_data.dart`.
- **Colori e font:** `lib/theme/app_theme.dart`.

## Note

- I font (Cormorant Garamond + Inter) sono caricati via `google_fonts` a runtime.
  Per un sito completamente offline, scarica i .ttf e dichiarali in `pubspec.yaml`.
- Immagini disponibili in locale: Quinto movimento, Essere, Vuoto, Trama,
  Ossequio, Home. Le altre opere useranno il segnaposto finché non aggiungi il file.
- La sezione About usa `signature.png` come immagine: sostituiscila con un
  ritratto/foto dell'artista quando disponibile.
