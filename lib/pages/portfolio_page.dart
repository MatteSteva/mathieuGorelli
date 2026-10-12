import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/works.dart';
import '../l10n/strings.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import '../widgets/work_card.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _gridKey = GlobalKey();

  void _scrollToGrid() {
    final ctx = _gridKey.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    return Column(
      children: [
        _Hero(onCta: _scrollToGrid),
        Container(key: _gridKey),
        ContentContainer(
          vertical: 88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionLabel(s.selectedWorks),
              const SizedBox(height: 40),
              const WorksGrid(),
            ],
          ),
        ),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  final VoidCallback onCta;
  const _Hero({required this.onCta});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    final size = MediaQuery.sizeOf(context);
    final narrow = size.width < 720;
    final heroHeight = (size.height - 74).clamp(460.0, 900.0);

    return SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/branding/banner.png', fit: BoxFit.cover),
          // gradiente per leggibilità
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.background.withValues(alpha: 0.92),
                  AppColors.background.withValues(alpha: 0.55),
                  AppColors.background.withValues(alpha: 0.25),
                ],
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.background,
                  AppColors.background.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.5],
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: narrow ? 24 : 64),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionLabel(s.heroSubtitle),
                    const SizedBox(height: 24),
                    Text(
                      s.heroTitle,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: narrow ? 52 : 76),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 460),
                      child: Text(s.heroTagline,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    const SizedBox(height: 40),
                    TextLink(label: s.heroCta, onTap: onCta),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Griglia responsiva di tutte le opere.
class WorksGrid extends StatelessWidget {
  const WorksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final cols = w < 600 ? 1 : (w < 1000 ? 2 : 3);
        const gap = 36.0;
        final itemWidth = (w - gap * (cols - 1)) / cols;

        return Wrap(
          spacing: gap,
          runSpacing: 56,
          children: [
            for (final work in kWorks)
              SizedBox(
                width: itemWidth,
                child: WorkCard(
                  work: work,
                  onTap: () => context.go('/opere/${work.slug}'),
                ),
              ),
          ],
        );
      },
    );
  }
}
