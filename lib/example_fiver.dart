import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_restapi/Models/products_model.dart';
import 'package:http/http.dart' as http;

class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({super.key});

  @override
  State<LastExampleScreen> createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/aedd946c-9bf5-474e-9bd9-f8c694bf709e'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API COURSE'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ProductsModel>(
            future: getProductsApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(snapshot.data!.data[index].shopaddress
                              .toString()),
                          subtitle: Text(
                              snapshot.data!.data[index].shopemail.toString()),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Flens&psig=AOvVaw3HfCPTUPsgYiyv0Kk9IjZn&ust=1664831088733000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIiKtIG5wvoCFQAAAAAdAAAAABAJ'),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.data[index].image.length,
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .25,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://picsum.photos/250?image=9'),
                                    ))),
                              );
                            },
                          ),
                        ),
                        Icon(snapshot.data!.data[index].isActive == false
                            ? Icons.favorite
                            : Icons.favorite_outline)
                      ],
                    );
                  },
                );
              } else {
                return Text('Loading');
              }
            },
          ))
        ],
      ),
    );
  }
}
