import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/features/main_homes/pop_up_screens/widgets/report_button.dart';
import 'package:tread_clone_assignment/features/main_homes/pop_up_screens/widgets/stick_handler.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const ReportTopBar(),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      thickness: 0.5,
                      height: 20,
                    ),
                    const WhyReportSentence(),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      thickness: 1,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).dividerColor,
          thickness: 1,
          height: 20,
        ),
        itemCount: Informations.reportOptions.length,
        itemBuilder: (context, index) {
          final reportOption = Informations.reportOptions[index];
          if (index == Informations.reportOptions.length - 1) {
            return Column(
              children: [
                ReportButton(text: reportOption),
                Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 1,
                  height: 20,
                ),
              ],
            );
          }
          return ReportButton(text: reportOption);
        },
      ),
    );
  }
}

class WhyReportSentence extends StatelessWidget {
  const WhyReportSentence({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textScaler: const TextScaler.linear(
              1.1,
            ),
            "Why are you reporting this thread?",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          Gaps.v5,
          Opacity(
            opacity: 0.5,
            child: Text(
              "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency serives - don't wait.",
              style: Theme.of(context).textTheme.bodySmall,
              textScaler: const TextScaler.linear(
                0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportTopBar extends StatelessWidget {
  const ReportTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: [
          const StickHandler(),
          Gaps.v5,
          Text(
            "Report",
            textScaler: const TextScaler.linear(
              1.1,
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
