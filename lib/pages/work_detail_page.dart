import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/works.dart';
import '../l10n/app_controller.dart';
import '../l10n/strings.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class WorkDetailPage extends StatelessWidget {
  final String slug;
  const WorkDetailPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    final it = AppScope.of(context).isItalian;
    final work = workBySlug(slug);

    if (work == null) {
      return ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('404', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 24),
            TextLink(label: s.allWorks, onTap: () => context.go('/')),
          ],
        ),
      );
    }

    final index = kWorks.indexOf(work);
    final prev = index > 0 ? kWorks[index - 1] : null;
    final next = index < kWorks.length - 1 ? kWorks[index + 1] : null;
    final wide = MediaQuery.sizeOf(context).width >= 900;

    final imagePane = _ImagePane(work: work, s: s);
    final infoPane = _InfoPane(work: work, s: s, it: it);

    return ContentContainer(
      vertical: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLink(label: s.back, arrow: false, onTap: () => context.go('/')),
          const SizedBox(height: 40),
          if (wide)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: imagePane),
                  const SizedBox(width: 64),
                  Expanded(flex: 2, child: infoPane),
                ],
              ),
            )
          else ...[
            imagePane,
            const SizedBox(height: 40),
            infoPane,
          ],
          const SizedBox(height: 80),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (prev != null)
                _AdjacentLink(
                    label: prev.title,
                    caption: '${s.back} · ${prev.year}',
                    onTap: () => context.go('/opere/${prev.slug}'))
              else
                const SizedBox.shrink(),
              if (next != null)
                _AdjacentLink(
                    label: next.title,
                    caption: '${next.year}',
                    alignEnd: true,
                    onTap: () => context.go('/opere/${next.slug}'))
              else
                const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImagePane extends StatelessWidget {
  final Work work;
  final Strings s;
  const _ImagePane({required this.work, required this.s});

  @override
  Widget build(BuildContext context) {
    if (!work.hasImage) {
      return AspectRatio(
        aspectRatio: 4 / 5,
        child: Container(
          color: AppColors.surface,
          alignment: Alignment.center,
          child: Text(
            s.imageComingSoon,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      );
    }
    return HoverBuilder(
      cursor: SystemMouseCursors.zoomIn,
      builder: (context, hovering) => GestureDetector(
        onTap: () => _openLightbox(context, work.asset!),
        child: Container(
          color: AppColors.surface,
          constraints: const BoxConstraints(maxHeight: 760),
          child: Image.asset(work.asset!, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

void _openLightbox(BuildContext context, String asset) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.94),
    builder: (context) => GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              maxScale: 4,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Image.asset(asset, fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 24,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    ),
  );
}

class _InfoPane extends StatelessWidget {
  final Work work;
  final Strings s;
  final bool it;
  const _InfoPane({required this.work, required this.s, required this.it});

  @override
  Widget build(BuildContext context) {
    final notes = work.notes(it);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${work.year}', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 12),
        Text(work.title, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 28),
        _Spec(label: s.technique, value: work.technique(it)),
        const SizedBox(height: 16),
        _Spec(label: it ? 'Dimensioni' : 'Dimensions', value: work.dimensions),
        if (notes.isNotEmpty) ...[
          const SizedBox(height: 36),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 24),
          for (final note in notes)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 9, right: 12),
                    child: SizedBox(
                        width: 6,
                        height: 6,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.accent,
                                shape: BoxShape.circle))),
                  ),
                  Expanded(
                      child: Text(note,
                          style: Theme.of(context).textTheme.bodyMedium)),
                ],
              ),
            ),
        ],
      ],
    );
  }
}

class _Spec extends StatelessWidget {
  final String label;
  final String value;
  const _Spec({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.textFaint)),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

class _AdjacentLink extends StatelessWidget {
  final String label;
  final String caption;
  final bool alignEnd;
  final VoidCallback onTap;
  const _AdjacentLink({
    required this.label,
    required this.caption,
    required this.onTap,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment:
              alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(caption.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 6),
            Text(label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: hovering
                        ? AppColors.accent
                        : AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}
