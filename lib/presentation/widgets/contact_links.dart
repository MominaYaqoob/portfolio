import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/widgets/app_icon.dart';
import 'package:nimbus/presentation/widgets/nimbus_link.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';

class ContactLinkItem {
  const ContactLinkItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.url,
  });

  final String label;
  final String value;
  final AppIconData icon;
  final String url;
}

class ContactLinks {
  static List<ContactLinkItem> get items => [
        const ContactLinkItem(
          label: StringConst.MAIL_ME,
          value: StringConst.DEV_EMAIL,
          icon: AppIconData.fa(FontAwesomeIcons.envelope),
          url: StringConst.EMAIL_URL,
        ),
        ContactLinkItem(
          label: StringConst.PHONE_ME,
          value: StringConst.PHONE_NUMBER,
          icon: const AppIconData.fa(FontAwesomeIcons.whatsapp),
          url:
              'https://wa.me/${StringConst.WHATSAPP_NUMBER.replaceAll('+', '')}?text=${Uri.encodeComponent(StringConst.WHATSAPP_MESSAGE)}',
        ),
        const ContactLinkItem(
          label: StringConst.GITHUB_LABEL,
          value: StringConst.GITHUB_ID,
          icon: AppIconData.fa(FontAwesomeIcons.github),
          url: StringConst.GITHUB_URL,
        ),
        const ContactLinkItem(
          label: StringConst.FOLLOW_ME_2,
          value: StringConst.FOLLOW_ME_2_URL,
          icon: AppIconData.fa(FontAwesomeIcons.linkedin),
          url: StringConst.LINKED_IN_URL,
        ),
      ];
}

class ContactLinkTile extends StatelessWidget {
  const ContactLinkTile({
    super.key,
    required this.item,
  });

  final ContactLinkItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => openUrlLink(item.url),
      borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
          border: Border.all(color: AppColors.darkBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.black100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.darkBorder),
              ),
              child: Center(
                child: AppIcon(
                  item.icon,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.grey250,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.value,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                      fontSize: 14,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactLinkIconRow extends StatelessWidget {
  const ContactLinkIconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: ContactLinks.items
          .map(
            (item) => NimBusLink(
              url: item.url,
              child: Tooltip(
                message: item.label,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.black100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.darkBorder),
                  ),
                  child: Center(
                    child: AppIcon(
                      item.icon,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
