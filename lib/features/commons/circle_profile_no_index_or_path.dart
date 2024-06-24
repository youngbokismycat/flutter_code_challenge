import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class CircleProfileNoNeedPathOrIndex extends StatefulWidget {
  final double radius;
  final bool isHaveBorder;
  const CircleProfileNoNeedPathOrIndex({
    super.key,
    required this.radius,
    required this.isHaveBorder,
  });

  @override
  State<CircleProfileNoNeedPathOrIndex> createState() =>
      _CircleProfileNoNeedPathOrIndexState();
}

class _CircleProfileNoNeedPathOrIndexState
    extends State<CircleProfileNoNeedPathOrIndex>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        CircleAvatar(
          radius: widget.radius,
          backgroundImage: const AssetImage(
            "assets/images/default_profile.webp",
          ),
          foregroundImage: NetworkImage(
            getImage(),
          ),
        ),
        if (widget.isHaveBorder)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).disabledColor.withOpacity(
                        0.2,
                      ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
