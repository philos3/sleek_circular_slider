import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExampleViewModel {
  final List<Color> pageColors;
  final CircularSliderAppearance appearance;
  final double min;
  final double max;
  final double value;
  final InnerWidget innerWidget;

  ExampleViewModel(
      {@required this.pageColors,
      @required this.appearance,
      this.min = 0,
      this.max = 100,
      this.value = 50,
      this.innerWidget});
}

class ExamplePage extends StatelessWidget {
  final ExampleViewModel viewModel;
  const ExamplePage({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: viewModel.pageColors,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                tileMode: TileMode.clamp)),
        child: SafeArea(
          child: Center(
              child:Column(
                children: <Widget>[
                  SleekCircularSlider(
                    onChangeStart: (double value) {},
                    onChangeEnd: (double value) {},
                    innerWidget: viewModel.innerWidget,
                    appearance: viewModel.appearance,
                    min: viewModel.min,
                    max: viewModel.max,
                    initialValue: viewModel.value,
                  ),
                  SleekCircularSlider(
                    min: 37,
                    max: 43,
                    initialValue: viewModel.value,
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            trackWidth: 3,
                            progressBarWidth: 20,
                            shadowWidth: 0
                        ),
                        customColors: CustomSliderColors(
                          trackColor: Colors.white,
                          dotColor: Colors.white,
                          progressBarColors:<Color>[Color(0xFF3FD8FF),Color(0xFFD1D3A1),Color(0xFFF9C16B),Color(0xFFFF4E00)],
                          gradientStartAngle: 180,
                          gradientEndAngle: viewModel.value/6*180/pi,
                        ),
                        infoProperties: InfoProperties(
                            topLabelText: "保护温度",
                            topLabelStyle: TextStyle(
                                color: Color(0xFF32C5FF),
                                fontSize: 14),
                            bottomLabelStyle: TextStyle(
                                color: Color(0xFF9B9AAE),
                                fontSize: 10),
                            bottomLabelText: "超过此温度设备会停止工作",
                            mainLabelStyle: TextStyle(
                                color: Color(0xFF283641),
                                fontSize: 65.0),
                            modifier: (double value) {
                              return '${value.toInt()}';
                            }),
                        startAngle: 180,
                        angleRange: 180,
                        size: 190.0,
                        animationEnabled: true),
                    onChange: (double value) {
                      // callback providing a value while its being changed (with a pan gesture)
                    },
                    onChangeStart: (double startValue) {
                      // callback providing a starting value (when a pan gesture starts)
                    },
                    onChangeEnd: (double endValue) {
                      // ucallback providing an ending value (when a pan gesture ends)

                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
