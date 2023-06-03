import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erecrutement/constants.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/apply_model.dart';
import '../models/user_model.dart';
import 'detailsApply.dart';

class ApplyListe extends StatefulWidget {
  const ApplyListe({super.key});

  @override
  State<ApplyListe> createState() => _ApplyListeState();
}

class _ApplyListeState extends State<ApplyListe> {
List<Apply> applies=[];
List<User> users=[];
  bool isLoading=false;
    late String user;
  @override

  void initState() {
    super.initState();
    fetchData();
    
  }
  
Future<void> fetchData() async{
  try{
    setState(() {
      isLoading=true;
    });
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
          final response = await Dio().get(Constants.apiUrl+'/api/apply',
          options: Options(headers:{"Authorization":"Bearer $token"},)
          );
if (response.statusCode == 200) {
        final  jsonList = response.data as Map<String,dynamic>;
       
        (jsonList['applies'] as List<dynamic> ).forEach((app) {
           print(app['resume']);
            applies.add(Apply.fromJson(app));

        });

        setState(() {
         
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }

}
Future<void> getLoggedInUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user');
    setState(() {
      user = userId ?? '';
          });
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');//delete token for this session
    await prefs.remove('user');
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: const Text('apply List'),
               backgroundColor: const Color(0xFF21899C),
      ),
       body:       ListView.builder(
          itemCount: applies.length,
          itemBuilder: (context, index) {
            final apply=applies[index];//apply est l(item de liste 'apply)
            return GestureDetector(
             
              child: ListTile(
                 onTap: () => {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detailapply(apply),//=>pageDeta avec index[applies]
                      ),
                    )
              },
                title: Text(applies[index].diploma
            //               style: const TextStyle(
            //   fontSize: 20,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.red,
            // ),
                ), //
                subtitle: Text(applies[index].resume),
              ),
            );
          },
        ),
      
      //  body: GridView.count(
      //     crossAxisCount: 3, // Nombre de colonnes dans le tableau
      //     children: List.generate(9, (index) {
      //       return Center(
      //         child: Container(
               
      //           child: Text(
      //             'applies $index',
      //             style: TextStyle(color: Colors.red, fontSize: 20),
      //           ),
      //         ),
      //       );
      //     }),
      //   ),
      
      
    );
  }
}


