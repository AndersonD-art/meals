import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import 'package:meals/widgets/custom_drawer_swipe_widget.dart';
import 'package:meals/widgets/drawer_animated_widget.dart';
import 'package:meals/widgets/hidenavbar_widget.dart';
import 'package:meals/widgets/clone_screen_widget.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  final int index;
  const TabsScreen(this.favoriteMeals, this.index);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Widget> _screens;

//Packet drawer_swipe
  late CustomDrawerSwipeWidget swipeDrawer;

  final HideNavbar hiding = HideNavbar();

  @override
  void initState() {
    _selectedScreenIndex = widget.index;
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
    super.initState();
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  var drawerKey = GlobalKey<CustomDrawerSwipeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      extendBodyBehindAppBar: true,
      body: CustomDrawerSwipeWidget(
        radius: 20,
        key: drawerKey,
        hasClone: true,
        bodyBackgroundPeekSize: 20,
        bodySize: 90,
        curve: Curves.easeOut,
        backgroundColor: Colors.blue,
        drawer: DrawerAnimated(),
        child: screen(),
        //por padrão não vem configurado com esta opção, foi realizado uma personalização no pacote drawer_swipe.
        //by default it is not designed with this option, a customization was made in the package
        image: CloneScreen(_selectedScreenIndex, widget.favoriteMeals),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: hiding.visible,
        builder: (context, bool value, child) => AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: value ? kBottomNavigationBarHeight : 0.0,
          child: Wrap(
            children: [
              BottomNavigationBar(
                onTap: _selectScreen,
                backgroundColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.grey[900]!.withOpacity(0.5),
                selectedItemColor: Theme.of(context).accentColor,
                currentIndex: _selectedScreenIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book_rounded),
                    label: 'Categorias',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favoritos',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget screen() {
    return Column(
      children: [
        AppBar(
          title: Text(
            _selectedScreenIndex == 0 ? 'Categorias' : 'Favoritos',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              if (drawerKey.currentState!.isOpened()) {
                drawerKey.currentState!.closeDrawer();
              } else {
                drawerKey.currentState!.openDrawer();
              }
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            controller: hiding.controller,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _screens[_selectedScreenIndex],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    hiding.controller.dispose();
    hiding.visible.dispose();
  }
}
