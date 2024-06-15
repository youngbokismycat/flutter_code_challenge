import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/custom_text_style.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/bubble_profiles.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';
import 'package:tread_clone_assignment/main_homes/widgets/buttons/cusom_icon_button.dart';
import 'package:tread_clone_assignment/main_homes/widgets/buttons/four_buttons.dart';
import 'package:tread_clone_assignment/main_homes/widgets/cards/thread.dart';
import 'package:tread_clone_assignment/main_homes/widgets/rows/replies_and_likes_row.dart';
import 'package:tread_clone_assignment/main_homes/widgets/columns/writer_to_repliers_column.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemStatusBarContrastEnforced: false,
          ),
          surfaceTintColor: Colors.white,
          centerTitle: true,
          title: Align(
            child: SvgPicture.asset(
              Informations.threadsLogoPath,
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
        itemCount: Informations.infos.length,
        itemBuilder: (context, index) {
          return Thread(
            index: index,
          );
        },
      ),
    );
  }
}
