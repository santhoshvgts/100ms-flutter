import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hmssdk_flutter/hmssdk_flutter.dart';
import 'package:hmssdk_flutter_example/common/util/utility_function.dart';
import 'package:hmssdk_flutter_example/meeting/peer_track_node.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoView extends StatefulWidget {
  final matchParent;

  final Size? viewSize;

  final bool setMirror;
  final double itemHeight;
  final double itemWidth;

  VideoView(
      {Key? key,
      this.viewSize,
      this.setMirror = false,
      this.matchParent = true,
      this.itemHeight = 200,
      this.itemWidth = 200,})
      : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    return Selector<PeerTrackNode, Tuple3<HMSVideoTrack?,bool,bool>>(
        builder: (_, data, __) {
          print("Video Built Again for ${data.item1?.peer?.name??"null"}");
          if ((data.item1 == null) || !data.item2 || data.item3) {
            return Container(
                height: widget.itemHeight + 100,
                width: widget.itemWidth - 5,
                child: Center(
                    child: CircleAvatar(
                      backgroundColor: Utilities.colors[context.read<PeerTrackNode>().peer.name.toLowerCase().codeUnitAt(0)%Utilities.colors.length],
                      radius: 36,
                        child: Text(Utilities.getAvatarTitle(
                            context.read<PeerTrackNode>().peer.name),style: TextStyle(fontSize: 36,color: Colors.white),))));
          } else {
            return Container(
              height: widget.itemHeight + 100,
              width: widget.itemWidth - 5,
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 15.0),
              child: HMSVideoView(
                track: data.item1!,
                setMirror: false,
                matchParent: false,
              ),
            );
          }
        },
        selector: (_, peerTrackNode) =>Tuple3(peerTrackNode.track, peerTrackNode.isVideoOn,peerTrackNode.track?.isDegraded??true) );
  }
}