import 'package:flutter/material.dart';
import '../data/site_data.dart';
import '../l10n/strings.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 900;

    final bio = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(s.aboutTitle),
        const SizedBox(height: 28),
        Text(s.aboutTitle, style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 40),
        for (final para in s.aboutBody)
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child:
                Text(para, style: Theme.of(context).textTheme.bodyLarge),
          ),
      ],
    );

    final portrait = Container(
      color: AppColors.surface,
      padding: const EdgeInsets.all(40),
      child: Image.asset('assets/branding/signature.png', fit: BoxFit.contain),
    );

    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (wide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: bio),
                const SizedBox(width: 64),
                Expanded(
                    flex: 2,
                    child: AspectRatio(aspectRatio: 3 / 4, child: portrait)),
              ],
            )
          else ...[
            bio,
            const SizedBox(height: 40),
            AspectRatio(aspectRatio: 4 / 3, child: portrait),
          ],
          const SizedBox(height: 88),
          SectionLabel(s.pressTitle),
          const SizedBox(height: 32),
          for (final item in kPress) _PressRow(item: item),
        ],
      ),
    );
  }
}

class _PressRow extends StatelessWidget {
  final PressItem item;
  const _PressRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            child: Text('${item.year}',
                style: Theme.of(context).textTheme.labelMedium),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(item.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.textPrimary)),
          ),
        ],
      ),
    );
  }
}
