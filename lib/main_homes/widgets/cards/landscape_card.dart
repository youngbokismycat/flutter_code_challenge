import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/utils.dart';

class LandScapeCard extends StatefulWidget {
  const LandScapeCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<LandScapeCard> createState() => _LandScapeCardState();
}

class _LandScapeCardState extends State<LandScapeCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Image.network(
          getImage(),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
