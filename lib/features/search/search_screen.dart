import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tread_clone_assignment/features/commons/widgets/default_padding.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/features/search/widgets/animated_cupertino_search_textfield.dart';
import 'package:tread_clone_assignment/features/search/widgets/list_tile_profile.dart';
import 'package:tread_clone_assignment/features/commons/widgets/pinned_delegate.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarContrastEnforced: false,
                  systemStatusBarContrastEnforced: false,
                ),
                centerTitle: false,
                surfaceTintColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  stretchModes: [
                    StretchMode.fadeTitle,
                  ],
                  title: DefaultPadding(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Search",
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PinnedBar(
                  isTabBar: false,
                  child: const CustomCupertinoSearchTextField(),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size24,
            ),
            child: ListView.separated(
              itemCount: 100,
              separatorBuilder: (context, index) => Divider(
                color: Theme.of(context).dividerColor.withOpacity(
                      0.5,
                    ),
              ),
              itemBuilder: (context, index) => const ListTileProfile(),
            ),
          ),
        ),
      ),
    );
  }
}
