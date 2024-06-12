import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/custom_text_style.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/bubble_profiles.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';
import 'package:tread_clone_assignment/main_homes/widgets/buttons/cusom_icon_button.dart';
import 'package:tread_clone_assignment/main_homes/widgets/buttons/four_buttons.dart';
import 'package:tread_clone_assignment/main_homes/widgets/post_threads_section.dart';
import 'package:tread_clone_assignment/main_homes/widgets/rows/replies_and_likes_row.dart';
import 'package:tread_clone_assignment/main_homes/widgets/columns/writer_to_repliers_column.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              toolbarHeight: size.height * 0.1,
              surfaceTintColor: Colors.white,
              snap: true,
              floating: true,
              centerTitle: true,
              title: Align(
                child: SvgPicture.asset(
                  ApiService.threadsLogoPath,
                  width: 40,
                  height: 40,
                ),
              ),
            )
          ],
          body: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 30,
              color: Theme.of(context).dividerColor.withOpacity(
                    0.5,
                  ),
            ),
            itemCount: ApiService.infos.length,
            itemBuilder: (context, index) {
              return PostThreadsSection(
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
