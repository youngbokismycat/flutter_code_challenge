import 'package:flutter/material.dart';

import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/common/model/thread_model.dart';

class LandScapeCard extends StatefulWidget {
  final String? url;
  const LandScapeCard({
    super.key,
    this.url,
  });

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
          widget.url ?? getImage(),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
