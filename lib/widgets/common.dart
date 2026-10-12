import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

/// Larghezza massima del contenuto per un layout editoriale.
const double kMaxContentWidth = 1180;

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    await launchUrl(uri);
  }
}

/// Ricostruisce il child in base allo stato di hover del mouse.
class HoverBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, bool hovering) builder;
  final MouseCursor cursor;
  const HoverBuilder({
    super.key,
    required this.builder,
    this.cursor = SystemMouseCursors.click,
  });

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: widget.builder(context, _hovering),
    );
  }
}

/// Contenitore centrato con larghezza massima e padding responsivo.
class ContentContainer extends StatelessWidget {
  final Widget child;
  final double vertical;
  const ContentContainer({super.key, required this.child, this.vertical = 96});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final hPad = w < 640 ? 24.0 : (w < 1024 ? 48.0 : 64.0);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}

/// Piccola etichetta di sezione in maiuscoletto spaziato.
class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 24, height: 1, color: AppColors.accent),
        const SizedBox(width: 12),
        Text(text.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.accent,
                  letterSpacing: 2.6,
                )),
      ],
    );
  }
}

/// Link testuale con sottolineatura animata su hover.
class TextLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool arrow;
  const TextLink(
      {super.key, required this.label, required this.onTap, this.arrow = true});

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (context, hovering) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: hovering ? AppColors.accent : AppColors.border,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label.toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 12,
                        letterSpacing: 2.2,
                        color: hovering
                            ? AppColors.accent
                            : AppColors.textPrimary,
                      )),
              if (arrow) ...[
                const SizedBox(width: 10),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 220),
                  offset: hovering ? const Offset(0.25, 0) : Offset.zero,
                  child: Icon(Icons.arrow_forward,
                      size: 15,
                      color:
                          hovering ? AppColors.accent : AppColors.textPrimary),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
