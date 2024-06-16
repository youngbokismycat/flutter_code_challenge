import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/activity/widgets/activity_profile_list_tile.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/search/widgets/list_tile_profile.dart';
import 'package:tread_clone_assignment/search/widgets/pinned_delegate.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(
    viewportFraction: 0.5,
  );
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
    _tabController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: options.length,
      child: SafeArea(
        child: NestedScrollView(
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
                  isTabBar: true,
                  child: SizedBox(
                    height: 40,
                    child: TabBar(
                      tabAlignment: TabAlignment.center,
                      padding: EdgeInsets.zero,
                      labelPadding: const EdgeInsets.only(
                        left: Sizes.size16,
                      ),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      unselectedLabelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.white,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size10,
                        ),
                        color: Colors.black,
                      ),
                      isScrollable: true,
                      controller: _tabController,
                      tabs: [
                        for (var option in options)
                          FractionallySizedBox(
                            heightFactor: 1.06,
                            child: Transform.translate(
                              offset: const Offset(0, 1),
                              child: Stack(
                                children: [
                                  Container(
                                    clipBehavior: Clip.none,
                                    padding: EdgeInsets.zero,
                                    child: SizedBox(
                                      width: 110,
                                      child: Center(child: Text(option)),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: AnimatedOpacity(
                                      duration: const Duration(
                                        milliseconds: 100,
                                      ),
                                      opacity: option ==
                                              options.elementAt(
                                                  _tabController.index)
                                          ? 0
                                          : 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                            width: 1,
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            Sizes.size10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v20,
                    DefaultPadding(
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          "Recommend for you",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Gaps.v10,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 84,
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 2,
                        child: SizedBox(
                          height: 200,
                          child: PageView.builder(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            pageSnapping: false,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  for (var i = 0; i < 2; i++)
                                    const RecommendCard(),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor.withOpacity(
                            0.5,
                          ),
                      height: 30,
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              ListView.separated(
                itemCount: 50,
                separatorBuilder: (context, index) => Divider(
                  color: Theme.of(context).dividerColor.withOpacity(
                        0.5,
                      ),
                  indent: 70,
                ),
                itemBuilder: (context, index) => const DefaultPadding(
                  child: ActivityProfileListTile(),
                ),
              ),
              const Center(
                child: Text("Relplies"),
              ),
              const Center(
                child: Text("Mentions"),
              ),
              const Center(
                child: Text("Verified"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendCard extends StatefulWidget {
  const RecommendCard({
    super.key,
  });

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: Sizes.size5),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(
              Sizes.size14,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size12,
                    vertical: Sizes.size12,
                  ),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: const AssetImage(
                          "assets/images/default_profile.webp",
                        ),
                        foregroundImage: NetworkImage(
                          getImage(),
                        ),
                      ),
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Opacity(
                    opacity: 0.5,
                    child: FaIcon(
                      FontAwesomeIcons.xmark,
                      size: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Spacer(),
                          Text(
                            faker.person.name(),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                            textScaler: const TextScaler.linear(
                              0.9,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                StackedTwoProfiles(
                                  backgroundColor: Theme.of(context)
                                      .dividerColor
                                      .withOpacity(0.5),
                                ),
                                Expanded(
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      faker.currency
                                          .name()
                                          .toLowerCase()
                                          .replaceAll(
                                              r' ', getBoolean() ? '_' : '.'),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.v5,
                          const Row(
                            children: [
                              Expanded(
                                child: FollowButton(
                                  isFollow: false,
                                  isFilled: true,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
