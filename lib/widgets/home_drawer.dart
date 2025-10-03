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
                decoration: BoxDecoration(
                  color: Color(0xFF8aae5c),
                  image: DecorationImage(
                    scale: 5.0,
                    image: AssetImage('assets/images/Icone1.png')
                  )
                ),
                padding: EdgeInsets.only(top: 110.0, left: 64),
                child: Text(
                  'AgroPédia',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff394834),
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              ExpansionTile(
                title: const Text(
                  'Componentes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff394834),
                    fontFamily: 'Roboto',
                  ),
                ),
                leading: const Icon(Icons.group, color: Color(0xff394834)),
                children: availableStudent.map((student) => ListTile(
                    contentPadding: const EdgeInsets.only(left: 30.0, right: 16.0),
                    leading: const Icon(Icons.person, color: Color(0xff394834),),
                    title: Text(
                      student.nome,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff394834),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ).toList(),
              ),
              ExpansionTile(
                title: Text(
                  'Sobre',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff394834),
                    fontFamily: 'Roboto',
                  ),
                ),
                leading: Icon(Icons.description, color: Color(0xff394834)),
                children: <Widget>[
                  ListTile(
                    title: 
                    Text(
                      "Essa aplicação foi resultado do trabalho avaliativo em grupo da matéria de Programação para Dispositivos Móveis.",
                      style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff394834),
                      fontFamily: 'Roboto',
                  ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
  }
}