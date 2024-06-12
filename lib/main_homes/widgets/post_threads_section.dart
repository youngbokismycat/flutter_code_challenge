import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/main_homes/widgets/rows/writer_and_ago_row.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/bubble_profiles.dart';
import 'package:tread_clone_assignment/main_homes/widgets/buttons/four_buttons.dart';
import 'package:tread_clone_assignment/main_homes/widgets/rows/replies_and_likes_row.dart';
import 'package:tread_clone_assignment/main_homes/widgets/columns/writer_to_repliers_column.dart';

class PostThreadsSection extends StatefulWidget {
  final int index;
  const PostThreadsSection({
    super.key,
    required this.index,
  });

  @override
  State<PostThreadsSection> createState() => _PostThreadsSectionState();
}

class _PostThreadsSectionState extends State<PostThreadsSection> {
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
    final info = ApiService.infos[widget.index];
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RealWriterRepliersColumn(
            index: widget.index,
            contentsHeight: columnSize?.height,
          ),
          Gaps.h10,
          ContentsColumn(
            key: _contentskey,
            index: widget.index,
            info: info,
          ),
        ],
      ),
    );
  }
}

class ContentsColumn extends StatelessWidget {
  const ContentsColumn({
    super.key,
    required this.index,
    required this.info,
  });

  final int index;
  final Map<String, dynamic> info;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WriterAndAgoRow(
            index: index,
          ),
          Text(
            info['content'],
            style: Theme.of(context).textTheme.bodySmall,
          ),
          LandscapeCard(
            index: index,
          ),
        ],
      ),
    );
  }
}

class RealWriterRepliersColumn extends StatelessWidget {
  const RealWriterRepliersColumn({
    super.key,
    required this.index,
    required this.contentsHeight,
  });
  final double? contentsHeight;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: contentsHeight ?? 200,
            maxWidth: 200,
          ),
          child: WriterToRepliersColumn(
            index: index,
          ),
        ),
      ],
    );
  }
}

class LandscapeCard extends StatelessWidget {
  final PageController _pageController = PageController(
    keepPage: true,
    viewportFraction: 0.35,
  );
  final int index;
  LandscapeCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final info = ApiService.infos[index];
    return FractionallySizedBox(
        widthFactor: 3,
        child: SizedBox(
          height: size.height * 0.23,
          child: PageView(
            controller: _pageController,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            children: [
              for (var landscape in info['landscape'])
                Row(
                  children: [
                    LandScapes(
                      size: size,
                      landscape: landscape,
                    ),
                  ],
                ),
            ],
          ),
        ));
  }
}

class LandScapes extends StatelessWidget {
  const LandScapes({
    super.key,
    required this.size,
    required this.landscape,
  });

  final Size size;
  final dynamic landscape;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: size.height * 0.23,
      width: size.width * 0.77,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Image.asset(
        landscape,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
