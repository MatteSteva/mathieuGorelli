import 'package:flutter/material.dart';
import '../data/site_data.dart';
import '../l10n/strings.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);

    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(s.projectsTitle),
          const SizedBox(height: 28),
          Text(s.projectsTitle,
              style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(s.projectsIntro,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(height: 64),
          for (final p in kProjects) _ProjectRow(title: p.title, year: p.year),
        ],
      ),
    );
  }
}

class _ProjectRow extends StatelessWidget {
  final String title;
  final int year;
  const _ProjectRow({required this.title, required this.year});

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      cursor: SystemMouseCursors.basic,
      builder: (context, hovering) => Container(
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Text(title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 34,
                        color: hovering
                            ? AppColors.accent
                            : AppColors.textPrimary,
                      )),
            ),
            const SizedBox(width: 16),
            Text('$year', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
