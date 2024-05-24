import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scelloo_test/componenets/custom_ripple.dart';
import 'package:scelloo_test/utils/constants/color_constants.dart';

class PostTile extends StatelessWidget {
  final String title;
  final String body;
  final void Function() onPostTileTap;
  final void Function() onEditTap;
  final void Function() onDeleteTap;

  const PostTile({
    required this.title,
    required this.body,
    required this.onPostTileTap,
    required this.onEditTap,
    required this.onDeleteTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRipple(
      borderRadius: 8,
      onTap: onPostTileTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    color: ColorConstants.textHeader,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Body',
                  style: TextStyle(
                    color: ColorConstants.textBody,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onEditTap,
                  icon: const Icon(Icons.edit_document),
                  color: ColorConstants.primary,
                ),
                const Gap(2),
                IconButton(
                  onPressed: onDeleteTap,
                  icon: const Icon(Icons.delete),
                  color: ColorConstants.errorBorder,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
