import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/search/widgets/pinned_delegate.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> options = [
    "All",
    "Replies",
    "Mentions",
    "Verified",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: false,
              surfaceTintColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                stretchModes: const [
                  StretchMode.fadeTitle,
                ],
                title: DefaultPadding(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Activity",
                      textScaler: const TextScaler.linear(
                        1.2,
                      ),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: PinnedSearchBar(
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    for (var option in options) Text(option),
                  ],
                ),
              ),
            ),
          ];
        },
        body: const Center());
  }
}
