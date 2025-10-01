import 'package:app_cultivo/data/data.dart';
import 'package:app_cultivo/widgets/card_widget.dart';
import 'package:app_cultivo/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class Plants extends StatelessWidget {
  const Plants({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        title: Text(KTexts.tituloApp),
      ),

      endDrawer: Drawer(
        child: Container(
          color: Color(0xffb3d38d),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF8aae5c)),
                child: Text(
                  'Componentes:',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff394834),
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              ...availableStudent.map((student) => ListTile(
                leading: Icon(Icons.person, color: Color(0xff394834),),
                title: Text(
                  student.nome,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff394834),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {

                },
              ))
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final plant in availablePlants)
              CardWidget(color: Theme.of(context).colorScheme.secondaryContainer, plant: plant),
          ],
        ),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}