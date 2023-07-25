import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_practice_magic_ball/utils/constants.dart';

class MagicBallImage extends StatelessWidget {
  final String state;

  const MagicBallImage({super.key, required this.state});

  Widget _picture(BuildContext context) => Column(
        children: [

          // Magic Ball images
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  state == error ? redBallPath : emptyBallPath,
                ),
                if (state == initState || state == error)
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        starsPath,
                        width: MediaQuery.of(context).size.width / 1.6,
                      ),
                      Image.asset(
                        smallStarsPath,
                        width: MediaQuery.of(context).size.width / 1.3,
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Bottom shadow images
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  state == error ? ellipseGlowRedPath : ellipseGlowPath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Image.asset(
                  state == error ? ellipseRedPath : ellipseBluePath,
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ],
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return _picture(context);
  }
}
