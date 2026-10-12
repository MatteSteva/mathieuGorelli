import 'package:flutter/material.dart';
import '../data/works.dart';
import '../l10n/app_controller.dart';
import '../theme/app_theme.dart';
import 'common.dart';

/// Scheda opera per la griglia del portfolio.
class WorkCard extends StatelessWidget {
  final Work work;
  final VoidCallback onTap;
  const WorkCard({super.key, required this.work, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final it = AppScope.of(context).isItalian;
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 5,
              child: ClipRect(
                child: Container(
                  color: AppColors.surface,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (work.hasImage)
                        AnimatedScale(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                          scale: hovering ? 1.04 : 1.0,
                          child: Image.asset(work.asset!, fit: BoxFit.cover),
                        )
                      else
                        _Placeholder(work: work),
                      // velo che si schiarisce su hover
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        color: Colors.black
                            .withValues(alpha: hovering ? 0.0 : 0.18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    work.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color: hovering
                              ? AppColors.accent
                              : AppColors.textPrimary,
                        ),
                  ),
                ),
                Text('${work.year}',
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            const SizedBox(height: 4),
            Text(work.caption(it),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final Work work;
  const _Placeholder({required this.work});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      alignment: Alignment.center,
      child: Text(
        work.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.textFaint,
              fontStyle: FontStyle.italic,
            ),
      ),
    );
  }
}
