# guide_widget

guide_widget is a new Flutter widget,which support you customization whatever you want.

## Getting Started

------

## How to Use

```python
# add this line to your dependencies
guide_widget: ^1.0.0
```

```python
import 'package:guide_widget/guide_widget.dart';

```

```python
        GuideWidget(
                  images: urls,
                  selectedColor: const Color(0xff1BB754),
                  unSelectedColor: Colors.white,
                  circleRadius: 10.0,
                  indicatorPaddingBottom: 10.0,
                  indicatorStyle: IndicatorStyle.CIRCLE,
                  enter: RaisedButton(
                    color: const Color(0xff1BB754),
                    onPressed: () {
                      // TODO 
                    },
                    textColor: Colors.white,
                    child: Text('Enter app'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ))
```
### API

| property        | description  |defaultValue
| :--------   | :-----  |:-----
| images     | List<String>    |
| selectedColor        | Color |Color(0xff1BB754)
| unSelectedColor        | Color |Colors.white
| indicatorStyle        | enum |IndicatorStyle.CIRCLE
| circleRadius        | double |10.0
| ellipticalWidth        | double: when 'indicatorStyle' property is IndicatorStyle.ELLIPTICAL valid|16.0
| ellipticalHeight       | double: when 'indicatorStyle' property is IndicatorStyle.ELLIPTICAL valid  |8.0
| cornerRadius        | double  |10.0
| indicatorPaddingBottom        | double  |10.0
| enter        | Widget: whatever you want widget,such as 'enter immediately' button |

[Jump to GitHub](https://github.com/manburenshenglu/guide_widget)
 
