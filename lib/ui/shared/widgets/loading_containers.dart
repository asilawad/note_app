import 'package:flutter/material.dart';

import 'container_custom.dart';

class loading_containers extends StatelessWidget {
  const loading_containers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 120,
                                  height: 30,
                                  child: ContainerCustom(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 206, 204, 204),
                                      Color.fromARGB(255, 165, 164, 164)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ContainerCustom(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 206, 204, 204),
                                      Color.fromARGB(255, 165, 164, 164)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ));
  }
}