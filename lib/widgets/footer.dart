import 'package:flutter/material.dart';
import '../l10n/strings.dart';
import '../data/site_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    final narrow = MediaQuery.sizeOf(context).width < 720;

    final social = Wrap(
      spacing: 24,
      runSpacing: 12,
      children: [
        for (final link in kSocials)
          HoverBuilder(
            builder: (context, hovering) => GestureDetector(
              onTap: () => openUrl(link.url),
              child: Text(
                link.label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      letterSpacing: 1.8,
                      color: hovering
                          ? AppColors.accent
                          : AppColors.textSecondary,
                    ),
              ),
            ),
          ),
      ],
    );

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: ContentContainer(
        vertical: 48,
        child: Flex(
          direction: narrow ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment:
              narrow ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mathieu Gorelli',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  '© 2026 · ${s.rights} · ${s.footerLaw}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            if (narrow) const SizedBox(height: 24),
            social,
          ],
        ),
      ),
    );
  }
}
