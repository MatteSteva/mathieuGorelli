import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_controller.dart';
import '../l10n/strings.dart';
import '../data/site_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';
import 'footer.dart';

class _NavItem {
  final String label;
  final String? path; // rotta interna
  final String? url; // link esterno
  const _NavItem(this.label, {this.path, this.url});
}

List<_NavItem> _navItems(Strings s) => [
      _NavItem(s.navPortfolio, path: '/'),
      _NavItem(s.navSound, path: '/sound-of-graphite'),
      _NavItem(s.navPrints, path: '/prints'),
      _NavItem(s.navProjects, path: '/progetti'),
      _NavItem(s.navAbout, path: '/about'),
      _NavItem(s.navVideo, url: Contacts.youtubeChannel),
      _NavItem(s.navContact, path: '/contatti'),
    ];

/// Struttura comune: nav sticky + contenuto scrollabile + footer.
class SiteScaffold extends StatefulWidget {
  final Widget child;
  final String currentPath;
  const SiteScaffold(
      {super.key, required this.child, required this.currentPath});

  @override
  State<SiteScaffold> createState() => _SiteScaffoldState();
}

class _SiteScaffoldState extends State<SiteScaffold> {
  final _scrollController = ScrollController();
  bool _menuOpen = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isMobile => MediaQuery.sizeOf(context).width < 900;

  void _go(_NavItem item) {
    setState(() => _menuOpen = false);
    if (item.url != null) {
      openUrl(item.url!);
    } else if (item.path != null && item.path != widget.currentPath) {
      context.go(item.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    const navHeight = 74.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(height: navHeight),
                    widget.child,
                    const SiteFooter(),
                  ],
                ),
              ),
            ),
          ),
          // Barra di navigazione
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _NavBar(
              height: navHeight,
              isMobile: _isMobile,
              items: _navItems(s),
              currentPath: widget.currentPath,
              menuOpen: _menuOpen,
              onTapItem: _go,
              onToggleMenu: () => setState(() => _menuOpen = !_menuOpen),
              onLogo: () {
                setState(() => _menuOpen = false);
                if (widget.currentPath != '/') context.go('/');
              },
            ),
          ),
          if (_isMobile && _menuOpen)
            Positioned(
              top: navHeight,
              left: 0,
              right: 0,
              bottom: 0,
              child: _MobileMenu(
                items: _navItems(s),
                currentPath: widget.currentPath,
                onTapItem: _go,
              ),
            ),
        ],
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  final double height;
  final bool isMobile;
  final List<_NavItem> items;
  final String currentPath;
  final bool menuOpen;
  final void Function(_NavItem) onTapItem;
  final VoidCallback onToggleMenu;
  final VoidCallback onLogo;

  const _NavBar({
    required this.height,
    required this.isMobile,
    required this.items,
    required this.currentPath,
    required this.menuOpen,
    required this.onTapItem,
    required this.onToggleMenu,
    required this.onLogo,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AppScope.of(context);
    final s = Strings.of(context);

    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 64),
            child: Row(
              children: [
                // Logo / wordmark
                HoverBuilder(
                  builder: (context, hovering) => GestureDetector(
                    onTap: onLogo,
                    child: Text(
                      'Mathieu Gorelli',
                      style:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 22,
                                color: hovering
                                    ? AppColors.accent
                                    : AppColors.textPrimary,
                              ),
                    ),
                  ),
                ),
                const Spacer(),
                if (!isMobile) ...[
                  for (final item in items)
                    Padding(
                      padding: const EdgeInsets.only(left: 26),
                      child: _NavLink(
                        item: item,
                        active: item.path == currentPath,
                        onTap: () => onTapItem(item),
                      ),
                    ),
                  const SizedBox(width: 26),
                  _LangToggle(controller: controller, s: s),
                ] else ...[
                  _LangToggle(controller: controller, s: s),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: onToggleMenu,
                    icon: Icon(menuOpen ? Icons.close : Icons.menu,
                        color: AppColors.textPrimary),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final _NavItem item;
  final bool active;
  final VoidCallback onTap;
  const _NavLink(
      {required this.item, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: onTap,
        child: Text(
          item.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 13.5,
                letterSpacing: 0.3,
                color: active || hovering
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                fontWeight: active ? FontWeight.w500 : FontWeight.w300,
              ),
        ),
      ),
    );
  }
}

class _LangToggle extends StatelessWidget {
  final AppController controller;
  final Strings s;
  const _LangToggle({required this.controller, required this.s});

  @override
  Widget build(BuildContext context) {
    Widget item(String code, String label) {
      final active = controller.locale.languageCode == code;
      return GestureDetector(
        onTap: () => controller.setLocale(Locale(code)),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  letterSpacing: 1.5,
                  color:
                      active ? AppColors.accent : AppColors.textFaint,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                ),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        item('it', 'IT'),
        Text('  /  ',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.border)),
        item('en', 'EN'),
      ],
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final List<_NavItem> items;
  final String currentPath;
  final void Function(_NavItem) onTapItem;
  const _MobileMenu({
    required this.items,
    required this.currentPath,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final item in items)
            InkWell(
              onTap: () => onTapItem(item),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  item.label,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 26,
                        color: item.path == currentPath
                            ? AppColors.accent
                            : AppColors.textPrimary,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
