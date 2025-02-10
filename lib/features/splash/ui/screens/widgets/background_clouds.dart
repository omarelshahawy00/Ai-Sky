import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/const_assets.dart';

class BackgroundClouds extends StatelessWidget {
  const BackgroundClouds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              ConstAssets.topCloud,
              fit: BoxFit.fill,
              height: 100,
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(
                ConstAssets.centerCloud1,
                width: 300, // Adjusted size to fit screen
                height: 200,
                fit: BoxFit.fill,
              ),
              const Spacer(),
              Flexible(
                child: SvgPicture.asset(
                  ConstAssets.centerCloud,
                  width: 300, // Adjusted size to fit screen
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          ConstAssets.bottomCloud,
          fit: BoxFit.fill,
          height: 220,
        ),
      ],
    );
  }
}
