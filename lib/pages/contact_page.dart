import 'package:flutter/material.dart';
import '../data/site_data.dart';
import '../l10n/strings.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    final narrow = MediaQuery.sizeOf(context).width < 760;

    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(s.contactTitle),
          const SizedBox(height: 28),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              s.contactTagline,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: narrow ? 40 : 60, height: 1.1),
            ),
          ),
          const SizedBox(height: 56),
          Wrap(
            spacing: 48,
            runSpacing: 40,
            children: [
              _ContactBlock(
                label: s.contactEmail,
                value: Contacts.email,
                onTap: () => openUrl('mailto:${Contacts.email}'),
              ),
              _ContactBlock(
                label: s.contactWhatsapp,
                value: '+39 345 0238676',
                onTap: () => openUrl(Contacts.whatsapp),
              ),
            ],
          ),
          const SizedBox(height: 72),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 32),
          Text(s.contactFollow.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.textFaint, letterSpacing: 2.4)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            children: [
              for (final link in kSocials)
                HoverBuilder(
                  builder: (context, hovering) => GestureDetector(
                    onTap: () => openUrl(link.url),
                    child: Text(
                      link.label,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                            color: hovering
                                ? AppColors.accent
                                : AppColors.textPrimary,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactBlock extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;
  const _ContactBlock(
      {required this.label, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.accent, letterSpacing: 2.2)),
            const SizedBox(height: 10),
            Text(value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: hovering
                          ? AppColors.accent
                          : AppColors.textPrimary,
                    )),
          ],
        ),
      ),
    );
  }
}
