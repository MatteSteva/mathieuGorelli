import 'package:flutter/material.dart';
import '../data/site_data.dart';
import '../l10n/strings.dart';
import '../widgets/common.dart';

class SoundPage extends StatelessWidget {
  const SoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Strings.of(context);
    final narrow = MediaQuery.sizeOf(context).width < 760;

    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(s.selectedWorks),
          const SizedBox(height: 28),
          Text(s.soundTitle,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: narrow ? 46 : 68)),
          const SizedBox(height: 56),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final para in s.soundBody)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: Text(para,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 18, height: 1.85)),
                  ),
                const SizedBox(height: 24),
                TextLink(
                    label: s.videoCta,
                    onTap: () => openUrl(Contacts.youtubeChannel)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
