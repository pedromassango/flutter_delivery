// import 'package:delivery/circular_image.dart';
import 'package:delivery/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:delivery/zoom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_theme/dynamic_theme.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.dark,
        data: (brightness) => new ThemeData(
          primarySwatch: Colors.teal,
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: MyHomePage(),
          );
        }
    );
  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
              color: Colors.grey[200],
              child: Container(
                color: Colors.grey[200],
              ),
            )),
      ),
    );
  }
}
