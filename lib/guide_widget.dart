library guide_widget;

import 'package:flutter/material.dart';

///author xjl
///description
///date 2020/2/25 15:46
///modify

enum IndicatorStyle {
  ///circle indicator
  CIRCLE,

  ///elliptical indicator
  ELLIPTICAL
}

class GuideWidget extends StatefulWidget {
  final List<String> images;
  final Color selectedColor;
  final Color unSelectedColor;
  final double circleRadius;

  ///elliptical indicator width
  final double ellipticalWidth;

  ///elliptical indicator height
  final double ellipticalHeight;

  ///elliptical indicator cornerRadius
  final double cornerRadius;
  final IndicatorStyle indicatorStyle;

  final double indicatorPaddingBottom;

  /// enter app btn or others whatever you want
  final Widget enter;

  const GuideWidget(
      {Key key,
      @required this.images,
      this.selectedColor: const Color(0xff1BB754),
      this.unSelectedColor: Colors.white,
      this.circleRadius: 10.0,
      this.ellipticalWidth: 16.0,
      this.ellipticalHeight: 8.0,
      this.cornerRadius: 10.0,
      this.indicatorPaddingBottom: 10.0,
      this.indicatorStyle: IndicatorStyle.CIRCLE,
      this.enter})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuideWidgetState();
}

class _GuideWidgetState extends State<GuideWidget> {
  PageController _pageController = PageController();
  List<Image> _imageWidgets = List();
  int _pageIndex = 0;
  GlobalKey<_GuideWidgetState> _pageIndicatorKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createImageWidgets(widget.images);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            _createPageView(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: widget.indicatorPaddingBottom +
                      (widget.indicatorStyle == IndicatorStyle.CIRCLE
                          ? widget.circleRadius * 2
                          : widget.ellipticalHeight)),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: _pageIndex == widget.images.length - 1
                    ? widget.enter
                    : Container(
                        height: 0,
                      ),
              ),
            ),
            _createPageIndicator()
          ],
        ),
      ),
    );
  }

  _createImageWidgets(images) {
    print("${images.length}");
    images.forEach((v) {
      v.startsWith(RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+"))
          ? _imageWidgets.add(Image.network(
              v,
              fit: BoxFit.fill,
            ))
          : _imageWidgets.add(Image.asset(
              v,
              fit: BoxFit.fill,
            ));
    });
    setState(() {});
    return _imageWidgets;
  }

  _createPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (pageIndex) {
        setState(() {
          _pageIndex = pageIndex;
        });
      },
      children: _imageWidgets,
    );
  }

  _createPageIndicator() {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.indicatorPaddingBottom),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
//          margin: EdgeInsets.only(bottom: 60),
//          height: 40,
//          width: 80,
//          padding: EdgeInsets.all(0),
//          decoration: BoxDecoration(
//              color: Colors.grey, //.withAlpha(128),
//              borderRadius: BorderRadius.all(const Radius.circular(6.0))),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapUp: (details) => _handleTapUp(details),
            child: Row(
              key: _pageIndicatorKey,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _createIndicator(),
            ),
          ),
        ),
      ),
    );
  }

  _handleTapUp(TapUpDetails details) {
    RenderBox renderBox = _pageIndicatorKey.currentContext.findRenderObject();
    Size widgetSize = renderBox.paintBounds.size;
    Offset tapOffset = renderBox.globalToLocal(details.globalPosition);
    if (tapOffset.dx > widgetSize.width / 2) {
      _scrollPage(1);
    } else {
      _scrollPage(-1);
    }
  }

  _scrollPage(changeValue) {
    _pageController.animateToPage(_pageIndex + changeValue,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  List<Widget> _createIndicator() {
    List<Widget> indicator = [];
    for (int i = 0; i < widget.images.length; i++) {
      indicator.add(
        Container(
            margin: EdgeInsets.all(3.0),
            width: widget.indicatorStyle == IndicatorStyle.CIRCLE
                ? widget.circleRadius
                : widget.ellipticalWidth,
            height: widget.indicatorStyle == IndicatorStyle.CIRCLE
                ? widget.circleRadius
                : widget.ellipticalHeight,
            decoration: BoxDecoration(
                borderRadius: widget.indicatorStyle == IndicatorStyle.CIRCLE
                    ? null
                    : BorderRadius.all(Radius.elliptical(
                        widget.cornerRadius, widget.cornerRadius)),
                shape: widget.indicatorStyle == IndicatorStyle.CIRCLE
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                color: i == _pageIndex
                    ? widget.selectedColor
                    : widget.unSelectedColor)),
      );
    }
    return indicator;
  }
}
