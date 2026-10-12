import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/portfolio_page.dart';
import 'pages/work_detail_page.dart';
import 'pages/sound_page.dart';
import 'pages/prints_page.dart';
import 'pages/projects_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'widgets/site_scaffold.dart';

/// Avvolge una pagina nella struttura comune (nav + footer).
/// Ogni navigazione crea una nuova istanza => scroll riparte dall'alto.
Page<void> _page({
  required LocalKey key,
  required String navPath,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    transitionDuration: const Duration(milliseconds: 350),
    child: SiteScaffold(currentPath: navPath, child: child),
    transitionsBuilder: (context, animation, secondary, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => _page(
          key: const ValueKey('portfolio'),
          navPath: '/',
          child: const PortfolioPage(),
        ),
      ),
      GoRoute(
        path: '/opere/:slug',
        pageBuilder: (context, state) {
          final slug = state.pathParameters['slug'] ?? '';
          return _page(
            key: ValueKey('opera-$slug'),
            navPath: '/',
            child: WorkDetailPage(slug: slug),
          );
        },
      ),
      GoRoute(
        path: '/sound-of-graphite',
        pageBuilder: (context, state) => _page(
          key: const ValueKey('sound'),
          navPath: '/sound-of-graphite',
          child: const SoundPage(),
        ),
      ),
      GoRoute(
        path: '/prints',
        pageBuilder: (context, state) => _page(
          key: const ValueKey('prints'),
          navPath: '/prints',
          child: const PrintsPage(),
        ),
      ),
      GoRoute(
        path: '/progetti',
        pageBuilder: (context, state) => _page(
          key: const ValueKey('progetti'),
          navPath: '/progetti',
          child: const ProjectsPage(),
        ),
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) => _page(
          key: const ValueKey('about'),
          navPath: '/about',
          child: const AboutPage(),
        ),
      ),
      GoRoute(
        path: '/contatti',
        pageBuilder: (context, state) => _page(
          key: const ValueKey('contatti'),
          navPath: '/contatti',
          child: const ContactPage(),
        ),
      ),
    ],
  );
}
