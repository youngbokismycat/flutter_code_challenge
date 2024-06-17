import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/main_homes/widgets/cards/thread.dart';
import 'package:tread_clone_assignment/search/widgets/pinned_delegate.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: const Center(
                child: FaIcon(
                  FontAwesomeIcons.globe,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                  ),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.gripLines),
                  onPressed: () {},
                )
              ],
            ),
            const SliverToBoxAdapter(
              child: DefaultPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v14,
                    ProfileReverseListTile(),
                    Gaps.v10,
                    ProfileFollowers(),
                    Gaps.v24,
                    ProfileButtons(),
                    Gaps.v8,
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: PinnedSearchBar(
                child: TabBar(
                  unselectedLabelColor: Theme.of(context).disabledColor,
                  indicatorColor: Colors.black,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      child: Text("Threads"),
                    ),
                    Tab(
                      child: Text(
                        "Relpies",
                      ),
                    ),
                  ],
                ),
                isTabBar: true,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 30,
                color: Theme.of(context).dividerColor.withOpacity(
                      0.5,
                    ),
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Thread(
                  index: index,
                );
              },
            ),
            ListView(
              children: const [],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileButton(
          title: "Edit profile",
        ),
        Gaps.h10,
        ProfileButton(
          title: "Share profile",
        ),
      ],
    );
  }
}

class ProfileFollowers extends StatelessWidget {
  const ProfileFollowers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const StackedTwoProfiles(
          backgroundColor: Colors.white,
        ),
        Opacity(
          opacity: 0.4,
          child: Text(
            "2 followers",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String title;
  const ProfileButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size7,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size8,
          ),
          border: Border.all(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class ProfileReverseListTile extends StatelessWidget {
  const ProfileReverseListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      visualDensity: const VisualDensity(vertical: 4),
      title: Text(
        "Youngbok",
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "young_bok",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Gaps.h5,
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size10, vertical: Sizes.size5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Sizes.size20,
                  ),
                  color: Theme.of(context).dividerColor.withOpacity(
                        0.3,
                      ),
                ),
                child: Opacity(
                  opacity: 0.3,
                  child: Text(
                    "threads.net",
                    style: Theme.of(context).textTheme.bodySmall,
                    textScaler: const TextScaler.linear(
                      0.7,
                    ),
                  ),
                ),
              )
            ],
          ),
          Gaps.v14,
          Text(
            "Meow mew. you wanna pet me? grrrr",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      trailing: const CircleAvatar(
        radius: Sizes.size40,
        backgroundImage: AssetImage(
          'assets/images/default_profile.webp',
        ),
        foregroundImage: AssetImage(
          'assets/images/clone_images/profile0.jpg',
        ),
      ),
    );
  }
}
