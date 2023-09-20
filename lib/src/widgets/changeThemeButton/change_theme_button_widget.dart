import 'package:flutter/material.dart';
import 'package:hulu/src/provider/theme_provider.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: 73 * w,
      height: 64 * h,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch.adaptive(
          activeColor: Colors.green,
            inactiveTrackColor: Colors.grey,
            thumbColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
            inactiveThumbColor: Colors.white,
            thumbIcon: MaterialStateProperty.resolveWith<Icon>((states) => Icon(Icons.dark_mode,
              color: Theme.of(context).primaryColor,)),
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              final provider = Provider.of<ThemeProvider>(context,listen: false);
              provider.toggleTheme(value);
            }
        ),
      ),
    );
    // return LiteRollingSwitch(
    //     width: 100,
    //     value: themeProvider.isDarkMode,
    //     iconOn: Icons.nights_stay,
    //     colorOn: Colors.black,
    //     colorOff: Color(0xff35C658),
    //     textOn: "",
    //     textOff: '',
    //     onChanged: (value){
    //       final provider = Provider.of<ThemeProvider>(context,listen: false);
    //       provider.toggleTheme(value);
    //     }, onTap: (){}, onDoubleTap: (){}, onSwipe: (){},);
  }
}
