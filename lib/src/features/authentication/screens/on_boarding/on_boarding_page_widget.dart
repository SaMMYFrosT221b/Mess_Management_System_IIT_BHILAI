import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/sizes.dart';
import 'package:mess_management_system/src/features/authentication/models/model_on_boarding.dart';


class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(MessDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image,),
            height: size.height*0.5,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 60.0,),
        ],
      ),
    );
  }
}
