import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/main_homes/widgets/cards/thread.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
      ),
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            surfaceTintColor: Colors.white,
            centerTitle: true,
            title: Align(
              child: SvgPicture.asset(
                Informations.threadsLogoPath,
                width: 40,
                height: 40,
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
            ),
          ),
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
      ),
    );
  }
}
