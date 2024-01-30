import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mimicon/utils/constants/app_images.dart';
import 'package:mimicon/utils/constants/app_numbers.dart';

class CameraControllerWidget extends StatelessWidget {
  const CameraControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppNumbers.largePadding.w,
          vertical: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppImages.cameraIcon),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppImages.frameIcon,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppImages.flipIcon,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
