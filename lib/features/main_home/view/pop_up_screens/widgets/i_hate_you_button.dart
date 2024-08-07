import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/main_home/view/pop_up_screens/report_screen.dart';

class IHateYouButton extends ConsumerWidget {
  final String hateness;
  const IHateYouButton({
    super.key,
    required this.hateness,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    void onReportButtonTap(BuildContext context) {
      if (hateness == "Report") {
        Navigator.of(context).pop();
        showModalBottomSheet(
          barrierColor: Colors.black.withOpacity(
            0.7,
          ),
          backgroundColor:
              isDarkMode(ref) ? Colors.grey.shade900 : Colors.white,
          context: context,
          isScrollControlled: false,
          clipBehavior: Clip.hardEdge,
          builder: (context) => const ReportScreen(),
        );
      }
    }

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onReportButtonTap(context),
        child: Container(
          width: size.width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            left: Sizes.size20,
          ),
          child: Text(
            hateness,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: hateness == "Report"
                      ? Colors.red
                      : isDarkMode(ref)
                          ? Colors.white
                          : Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
