import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_practice_magic_ball/utils/constants.dart';

class MagicBallImage extends StatelessWidget {
  final String state;

  const MagicBallImage({super.key, required this.state});

  Widget picture(BuildContext context) => Column(
        children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  state == error ? redBallPath : emptyBallPath,

                ),
                if (state == notActive || state == error)
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        starsPath,
                        width: MediaQuery.of(context).size.width-150,

                      ),
                      Image.asset(
                        smallStarsPath,
                        width: MediaQuery.of(context).size.width-100,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  ellipseGlowPath,
                  width: MediaQuery.of(context).size.width-150,
                ),
                Image.asset(
                  state == error ? ellipseRedPath: ellipseBluePath,
                  width: MediaQuery.of(context).size.width-280,
                ),

              ],
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return picture(context);
  }
}
