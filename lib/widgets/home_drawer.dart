import 'package:flutter/material.dart';
import 'package:app_cultivo/data/students_data.dart';

class HomeDrawer extends StatelessWidget{
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 280,
        child: Container(
          color: Color(0xffb3d38d),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF8aae5c)),
                padding: EdgeInsets.all(28.0),
                child: Text(
                  'Componentes',
                  style: TextStyle(
                    fontSize: 30,
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
                    fontSize: 18,
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
      );
  }
}