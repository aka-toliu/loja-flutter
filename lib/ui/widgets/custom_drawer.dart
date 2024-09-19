import 'package:flutter/material.dart';
import 'package:loja/ui/widgets/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController? pageController;

  const CustomDrawer({super.key, this.pageController});

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.purple,
            Colors.deepPurpleAccent
          ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 32),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(8),
                height: 170,
                child: Stack(
                  children: [
                    const Positioned(
                      top: 8,
                      left: 0,
                      child: Text('Loja\nFlutter',
                        style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Olá', style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          GestureDetector(
                            child: Text('Entre ou cadastre-se', style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                            onTap: (){},
                          )
                        ],
                    ))
                  ],
                ),
              ),
              const Divider(),
              DrawerTile(icon: Icons.home, text: "Início", pageController: pageController,page: 0,),
              DrawerTile(icon: Icons.list, text: "Produtos", pageController: pageController,page: 1,),
              DrawerTile(icon: Icons.location_on, text: "Lojas", pageController: pageController,page: 2,),
              DrawerTile(icon: Icons.playlist_add_check, text: "Pedidos", pageController: pageController,page: 3,),
            ],
          )
        ],
      ),
    );
  }
}
