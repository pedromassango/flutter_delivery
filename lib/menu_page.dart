import 'package:delivery/circular_image.dart';
import 'package:delivery/zoom_scaffold.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.search, 'Search'),
    MenuItem(Icons.shopping_basket, 'Basket'),
    MenuItem(Icons.favorite, 'Discounts'),
    MenuItem(Icons.code, 'Prom-codes'),
    MenuItem(Icons.format_list_bulleted, 'Orders'),
  ];

  @override
  Widget build(BuildContext context) {
    void changeBrightness() {
      DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
    }
    void changeColor() {
      DynamicTheme.of(context).setThemeData(new ThemeData(
          primaryColor: Theme.of(context).primaryColor == Colors.red? Colors.yellow: Colors.blue
      ));
    }
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        // color: Color(0xff000000),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularImage(
                    NetworkImage(imageUrl),
                  ),
                ),
                Text(
                  'Tatiana',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              children: options.map((item) {
                return ListTile(
                  leading: Icon(
                    item.icon,
                    // color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      // color: Colors.white
                    ),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              onTap: () {changeColor();

              },
              leading: Icon(
                Icons.settings,
                // color: Colors.white,
                size: 20,
              ),
              title: Text('Settings',
                  style: TextStyle(fontSize: 14,
                    // color: Colors.white
                  )),
            ),
            ListTile(
              onTap: (){changeBrightness();},
              leading: Icon(
                Icons.wb_sunny,
                // color: Colors.white,
                size: 20,
              ),
              title: Text('Change Theme',
                  style: TextStyle(fontSize: 14,
                    // color: Colors.white
                  )),
            ),
          ],
        ),
      ),
    );

  }

}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
