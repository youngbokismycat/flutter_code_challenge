import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/search/widgets/animated_cupertino_search_textfield.dart';
import 'package:tread_clone_assignment/search/widgets/list_tile_profile.dart';
import 'package:tread_clone_assignment/search/widgets/pinned_delegate.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
                delegate: PinnedSearchBar(
                    child: const CustomCupertinoSearchTextField()),
              ),
            ];
          },
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
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
