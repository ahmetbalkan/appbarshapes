import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            shape: WaveShapeBorder(),
            leading: Padding(
              padding: const EdgeInsets.only(
                  bottom: 100.0), // Bu değeri ihtiyacınıza göre ayarlayın.
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 100.0), // Bu değeri ihtiyacınıza göre ayarlayın.
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              )
            ],
            title: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text(
                "Test Text",
                style: TextStyle(color: Colors.white),
              ),
            ),
            centerTitle: true,
            toolbarHeight: 150,
            titleSpacing: 0.0, // Başlığın varsayılan boşluğunu kaldırır.
          ),
        ),
      ),
    );
  }
}

class WaveShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();

    // Başlangıç üst sol köşede
    path.moveTo(0, 0);
    path.lineTo(0, rect.height * 0.5);

    // Dalga yukarıya doğru hareket edecek.
    path.quadraticBezierTo(rect.width * 0.25, rect.height * 0.25,
        rect.width * 0.5, rect.height * 0.5);
    path.quadraticBezierTo(
        rect.width * 0.75, rect.height * 0.75, rect.width, rect.height * 0.5);

    // Dalganın sonrası AppBar'ın üst kısmına doğru bitiyor
    path.lineTo(rect.width, 0);

    path.close();

    return path;
  }
}

class HorizontalShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, rect.height / 2)
      ..lineTo(rect.width, (rect.height / 2) - 25)
      ..lineTo(rect.width, 0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class InvertedRoundShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, rect.height * 0.5)
      ..quadraticBezierTo(
          rect.width * 0.5, rect.height * 0.25, rect.width, rect.height * 0.5)
      ..lineTo(rect.width, 0)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class RoundShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, rect.height * 0.5)
      ..quadraticBezierTo(
          rect.width * 0.5, rect.height * 0.75, rect.width, rect.height * 0.5)
      ..lineTo(rect.width, 0)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class ArrowsShapeBorder extends ShapeBorder {
  final double maxHeight;

  ArrowsShapeBorder(
      {this.maxHeight =
          100}); // Varsayılan değer 250, istediğiniz bir değerle değiştirebilirsiniz.

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(
          0,
          maxHeight -
              50) // maxHeight - 50 (bu sayede mavi alanın yüksekliğini kontrol edebiliriz)
      ..lineTo(rect.width * 0.5 - 300, maxHeight - 50)
      ..lineTo(rect.width * 0.5, maxHeight)
      ..lineTo(rect.width * 0.5 + 300, maxHeight - 50)
      ..lineTo(rect.width, maxHeight - 50)
      ..lineTo(rect.width, 0)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
