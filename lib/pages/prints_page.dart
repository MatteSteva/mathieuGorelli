import 'package:flutter/material.dart';
import '../data/site_data.dart';
import '../l10n/strings.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class PrintsPage extends StatelessWidget {
  const PrintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);

    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('Shop'),
          const SizedBox(height: 28),
          Text(s.printsTitle,
              style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(s.printsBody,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              TextLink(
                  label: s.printsCta,
                  onTap: () => openUrl('mailto:${Contacts.email}')),
              TextLink(
                  label: 'Etsy',
                  onTap: () => openUrl(Contacts.etsy)),
            ],
          ),
          const SizedBox(height: 72),
          LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final cols = w < 600 ? 1 : (w < 900 ? 2 : 3);
              const gap = 24.0;
              final itemW = (w - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final img in kShopImages)
                    SizedBox(
                      width: itemW,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          color: AppColors.surface,
                          child: Image.asset(img, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
