import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/contact_links.dart';
import 'package:nimbus/presentation/widgets/nimbus_link.dart';
import 'package:nimbus/presentation/widgets/page_section.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  static const _highlightWords = [
    'Flutter',
    'Firebase',
    'REST API',
    'UI/UX',
    'Stick4Guide',
    'QMH Technologies',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageSection(
      backgroundColor: AppColors.darkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.ABOUT_LABEL.toUpperCase(),
            style: textTheme.labelLarge?.copyWith(
              color: AppColors.primaryColor,
              fontSize: 13,
              letterSpacing: 1.4,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 28),
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, info) {
              final isWide = info.screenSize.width >= 900;

              if (isWide) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 13,
                          child: _BioCard(textTheme: textTheme),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 7,
                          child: _EducationCard(textTheme: textTheme),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _ValuesCard(textTheme: textTheme)),
                        const SizedBox(width: 16),
                        Expanded(child: _CoreStackCard(textTheme: textTheme)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _QuickConnectCard(textTheme: textTheme),
                        ),
                      ],
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  _BioCard(textTheme: textTheme),
                  const SizedBox(height: 16),
                  _EducationCard(textTheme: textTheme),
                  const SizedBox(height: 16),
                  _ValuesCard(textTheme: textTheme),
                  const SizedBox(height: 16),
                  _CoreStackCard(textTheme: textTheme),
                  const SizedBox(height: 16),
                  _QuickConnectCard(textTheme: textTheme),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BentoCard extends StatelessWidget {
  const _BentoCard({
    required this.child,
    this.padding = const EdgeInsets.all(28),
    this.alignment = Alignment.topLeft,
  });

  final Widget child;
  final EdgeInsets padding;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: child,
    );
  }
}

class _BioCard extends StatelessWidget {
  const _BioCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return _BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor.withOpacity(0.55),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    ImagePath.PROFILE_PHOTO,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.darkCardHover,
                        alignment: Alignment.center,
                        child: Text(
                          StringConst.NAME_ABBREV,
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.INTRO,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${StringConst.POSITION} & ${StringConst.UI_UX}',
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey250,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _HighlightedAboutText(
            text: StringConst.ABOUT_ME_DESC_SHORT,
            baseStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.offWhite,
              height: 1.75,
              fontSize: 15,
            ),
            highlightStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.primaryColor,
              height: 1.75,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            highlights: AboutMeSection._highlightWords,
          ),
          const SizedBox(height: 28),
          NimBusLink(
            url: StringConst.MAILTO_SCHEME,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.35),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Text(
                StringConst.LETS_WORK_TOGETHER,
                style: textTheme.labelLarge?.copyWith(
                  color: AppColors.darkBackground,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return _BentoCard(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringConst.ABOUT_EDUCATION_DEGREE,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            StringConst.ABOUT_EDUCATION_SCHOOL,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.grey250,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ValuesCard extends StatelessWidget {
  const _ValuesCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final pills = Data.valuePills;

    return _BentoCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _ValuePill(label: pills[0])),
              const SizedBox(width: 12),
              Expanded(child: _ValuePill(label: pills[1])),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _ValuePill(label: pills[2])),
              const SizedBox(width: 12),
              Expanded(child: _ValuePill(label: pills[3])),
            ],
          ),
        ],
      ),
    );
  }
}

class _ValuePill extends StatelessWidget {
  const _ValuePill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.55)),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

class _CoreStackCard extends StatelessWidget {
  const _CoreStackCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return _BentoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Core Stack',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.offWhite,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Data.coreStackPills
                .map((label) => _StackPill(label: label))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _StackPill extends StatelessWidget {
  const _StackPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.black100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.offWhite,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
      ),
    );
  }
}

class _QuickConnectCard extends StatelessWidget {
  const _QuickConnectCard({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return _BentoCard(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringConst.QUICK_CONNECT,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.grey250,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          const ContactLinkIconRow(),
        ],
      ),
    );
  }
}

class _HighlightedAboutText extends StatelessWidget {
  const _HighlightedAboutText({
    required this.text,
    required this.baseStyle,
    required this.highlightStyle,
    required this.highlights,
  });

  final String text;
  final TextStyle? baseStyle;
  final TextStyle? highlightStyle;
  final List<String> highlights;

  @override
  Widget build(BuildContext context) {
    final spans = <InlineSpan>[];
    var remaining = text;

    while (remaining.isNotEmpty) {
      var matchIndex = -1;
      String? matchWord;

      for (final word in highlights) {
        final index = remaining.indexOf(word);
        if (index != -1 && (matchIndex == -1 || index < matchIndex)) {
          matchIndex = index;
          matchWord = word;
        }
      }

      if (matchIndex == -1 || matchWord == null) {
        spans.add(TextSpan(text: remaining, style: baseStyle));
        break;
      }

      if (matchIndex > 0) {
        spans.add(
          TextSpan(text: remaining.substring(0, matchIndex), style: baseStyle),
        );
      }

      spans.add(TextSpan(text: matchWord, style: highlightStyle));
      remaining = remaining.substring(matchIndex + matchWord.length);
    }

    return SelectableText.rich(TextSpan(children: spans));
  }
}
