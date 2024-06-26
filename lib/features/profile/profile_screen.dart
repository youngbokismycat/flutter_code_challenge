import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/commons/widgets/circle_profile_no_index_or_path.dart';
import 'package:tread_clone_assignment/features/commons/widgets/default_padding.dart';
import 'package:tread_clone_assignment/features/commons/widgets/four_buttons.dart';
import 'package:tread_clone_assignment/features/commons/widgets/landscape_card.dart';
import 'package:tread_clone_assignment/features/commons/widgets/stacked_two_profile.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/settings/settings_screen.dart';
import 'package:tread_clone_assignment/features/commons/widgets/pinned_delegate.dart';

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

  void _onSettingsTab() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  systemNavigationBarContrastEnforced: false,
                  systemStatusBarContrastEnforced: false,
                ),
                leading: Center(
                  child: FaIcon(
                    FontAwesomeIcons.globe,
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: isDarkMode(context) ? Colors.white : Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.gripLines),
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                    onPressed: () => _onSettingsTab(),
                  ),
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
                pinned: true,
                delegate: PinnedBar(
                  isTabBar: true,
                  child: TabBar(
                    indicatorWeight: 2,
                    unselectedLabelColor: isDarkMode(context)
                        ? Colors.grey.shade700
                        : Colors.grey.shade500,
                    indicatorColor:
                        isDarkMode(context) ? Colors.white : Colors.black,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Threads",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Relplies",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: const [
              ProfileListview(
                child: DefaultPadding(
                  child: ProfileThread(),
                ),
              ),
              ProfileListview(
                child: DefaultPadding(
                  child: RepliesThreads(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RepliesThreads extends StatefulWidget {
  const RepliesThreads({
    super.key,
  });

  @override
  State<RepliesThreads> createState() => _RepliesThreadsState();
}

class _RepliesThreadsState extends State<RepliesThreads> {
  final GlobalKey _contentskey = GlobalKey();

  Size? columnSize;
  Offset? offset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        columnSize = getSize();
      });
    });
  }

  Size? getSize() {
    if (_contentskey.currentContext != null) {
      final RenderBox renderBox =
          _contentskey.currentContext!.findRenderObject() as RenderBox;
      Size columnSize = renderBox.size;
      return columnSize;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const CircleProfileNoNeedPathOrIndex(
                radius: Sizes.size20,
                isHaveBorder: true,
              ),
              Expanded(
                child: VerticalDivider(
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                  color: Theme.of(context).dividerColor.withOpacity(0.5),
                ),
              ),
              const ProfileProfile(
                radius: Sizes.size20,
                isHaveBorder: true,
              ),
              Gaps.v48,
            ],
          ),
          Gaps.h10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      faker.person.name().toLowerCase().replaceAll(r' ', "_"),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                    ),
                    Gaps.h5,
                    if (getBoolean())
                      SvgPicture.asset(
                        'assets/svgs/verified.svg',
                        width: Sizes.size12,
                      ),
                    const Spacer(),
                    Opacity(
                      opacity: 0.4,
                      child: Text(
                        "${getInt()}h",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Gaps.h10,
                    const FaIcon(
                      FontAwesomeIcons.ellipsis,
                      size: Sizes.size16,
                    ),
                  ],
                ),
                Gaps.v4,
                Text(
                  faker.lorem.sentence(),
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gaps.v10,
                if (getBoolean()) const ReThreadBox(),
                Gaps.v5,
                const FourButtons(),
                Gaps.v16,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "young_bok",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600, height: 1),
                    ),
                    Gaps.h7,
                    const Spacer(),
                    Opacity(
                      opacity: 0.4,
                      child: Text(
                        "${getInt()}h",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              height: 1,
                            ),
                      ),
                    ),
                    Gaps.h10,
                    const FaIcon(
                      FontAwesomeIcons.ellipsis,
                      size: Sizes.size16,
                    ),
                  ],
                ),
                Gaps.v5,
                Text(
                  faker.lorem.sentence(),
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gaps.v12,
                const FourButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileListview extends StatelessWidget {
  final Widget child;
  const ProfileListview({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: Sizes.size10,
      ),
      separatorBuilder: (context, index) => Divider(
        height: 30,
        color: Theme.of(context).dividerColor.withOpacity(
              0.5,
            ),
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return child;
      },
    );
  }
}

class ProfileThread extends StatelessWidget {
  const ProfileThread({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      dense: false,
      leading: const ProfileProfile(
        radius: Sizes.size20 + 2,
        isHaveBorder: true,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "young_bok",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600, height: 1),
          ),
          Gaps.h7,
          const Spacer(),
          Opacity(
            opacity: 0.4,
            child: Text(
              "${getInt()}h",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    height: 1,
                  ),
            ),
          ),
          Gaps.h10,
          const FaIcon(
            FontAwesomeIcons.ellipsis,
            size: Sizes.size16,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v5,
          Text(
            faker.lorem.sentence(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Gaps.v12,
          const ReThreadBox(),
          Gaps.v8,
          const FourButtons(),
        ],
      ),
    );
  }
}

class ReThreadBox extends StatelessWidget {
  const ReThreadBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
        border: Border.all(
          width: 0.7,
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
        ),
        child: DefaultPadding(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleProfileNoNeedPathOrIndex(
                    radius: Sizes.size12,
                    isHaveBorder: false,
                  ),
                  Gaps.h7,
                  Text(
                    faker.person.name().toLowerCase().replaceAll(r' ', '_'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Gaps.h5,
                  SvgPicture.asset(
                    'assets/svgs/verified.svg',
                    width: Sizes.size12,
                  ),
                ],
              ),
              Gaps.v10,
              Text(
                "This is a very long text to test overflow and overlay style but It doesn't matter what the contents are meaning so I just write comments too long so my idea is go less please help me my english is suck and nico like suck it suck do you like suck i hate suck",
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              Gaps.v20,
              const LandScapeCard(),
            ],
          ),
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
        StackedTwoProfiles(
          backgroundColor: isDarkMode(context)
              ? const Color.fromARGB(255, 20, 20, 20)
              : Colors.white,
        ),
        Opacity(
          opacity: 0.4,
          child: Text(
            "2 followers",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
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
            width: 0.5,
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
                  horizontal: Sizes.size10,
                  vertical: Sizes.size5,
                ),
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
              ),
            ],
          ),
          Gaps.v14,
          Text(
            "Meow mew. you wanna pet me? grrrr",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      trailing: const ProfileProfile(
        radius: Sizes.size40,
        isHaveBorder: false,
      ),
    );
  }
}

class ProfileProfile extends StatelessWidget {
  final double radius;
  final bool isHaveBorder;
  const ProfileProfile({
    super.key,
    required this.radius,
    required this.isHaveBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage(
            'assets/images/default_profile.webp',
          ),
          foregroundImage: const AssetImage(
            'assets/images/clone_images/profile0.jpg',
          ),
        ),
        if (isHaveBorder)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).disabledColor.withOpacity(0.2),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
