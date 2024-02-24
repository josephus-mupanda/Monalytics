
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:monalystics/config/constants.dart';

import '../../../../config/values/values.dart';
import '../../../../models/recent_user_model.dart';
import '../../../../responsive.dart';


class RecentUsers extends StatelessWidget {
  const RecentUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.lightSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Liste des utilisateurs",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: double.infinity,
              child: (!Responsive.isMobile(context))?
                  DataTable(
                    horizontalMargin: 0,
                    columnSpacing: kDefaultPadding,
                    columns: const [
                      DataColumn(
                        label: Text("NOMS"),
                      ),
                      /*DataColumn(
                        label: Text("Applied Position"),
                      ),*/
                      DataColumn(
                        label: Text("E-MAILS"),
                      ),
                      DataColumn(
                        label: Text("DATE"),
                      ),
                      /*DataColumn(
                        label: Text("Status"),
                      ),*/
                      DataColumn(
                        label: Text("MODIFICATION"),
                      ),
                    ],
                    rows: List.generate(
                      recentUsers.length,
                      (index) => recentUserDataRow(recentUsers[index], context),
                    ),
                  ) :
                  Column(
                    children: List.generate(
                      recentUsers.length,
                          (index) => userListView(recentUsers[index], context),
                    ),
                  )
              ,
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: Colors.white,
              fontSize: 14,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.name!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                userInfo.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
     /* DataCell(Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.role).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.role)),
            borderRadius: BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(userInfo.role!))),
  */
      DataCell(Text(userInfo.email!)),
      DataCell(Text(userInfo.date!)),
      /*DataCell(Text(userInfo.posts!)),*/
      DataCell(
        Row(
          children: [
            TextButton(
              child: const Text('Modifier', style: TextStyle(color: AppColors.kGreenColor)),
              onPressed: () {},
            ),
            SizedBox(
              width: 6,
            ),
            TextButton(
              child: const Text("Bloquer", style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                          title: const Center(
                            child: Column(
                              children: [
                                Icon(Icons.warning_outlined,
                                    size: 36, color: Colors.red),
                                SizedBox(height:kDefaultPadding/2),
                                Text("Confirm Deletion"),
                              ],
                            ),
                          ),
                          content: Container(
                            color: AppColors.white,
                            height: 70,
                            child: Column(
                              children: [
                                Text(
                                    "Are you sure want to delete '${userInfo.name}'?"),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                        icon: const Icon(
                                          Icons.close,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.grey),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: const Text("Cancel")),
                                    const SizedBox(
                                      width: kDefaultPadding,
                                    ),
                                    ElevatedButton.icon(
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () {},
                                        label: const Text("Delete"))
                                  ],
                                )
                              ],
                            ),
                          ));
                    });
              },
              // Delete
            ),
          ],
        ),
      ),
    ],
  );
}

Column userListView(RecentUser userInfo, BuildContext context){
  return Column(
    children:[
      ListTile(
        onTap: () {},
        leading: TextAvatar(
          size: 35,
          backgroundColor: Colors.white,
          textColor: Colors.white,
          fontSize: 14,
          upperCase: true,
          numberLetters: 1,
          shape: Shape.Rectangle,
          text: userInfo.name!,
        ),
        title: Text(userInfo.name!),
        subtitle: Text(userInfo.email!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: AppColors.kGreenColor),
              onPressed: () {},
            ),
              IconButton(
                icon: const Icon(Icons.lock, color: Colors.red),
                onPressed: ()  {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: const Center(
                              child: Column(
                                children: [
                                  Icon(Icons.warning_outlined,
                                      size: 36, color: Colors.red),
                                  SizedBox(height: kDefaultPadding/2),
                                  Text("Confirm Deletion"),
                                ],
                              ),
                            ),
                            content: Container(
                              color: AppColors.white,
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                      "Are you sure want to delete '${userInfo.name}'?"),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                          icon: const Icon(
                                            Icons.close,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.grey),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          label: const Text("Cancel")),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton.icon(
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 14,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () {},
                                          label: const Text("Delete"))
                                    ],
                                  )
                                ],
                              ),
                            ));
                      });
                },
              ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5, left: 30, right: 5),
        height: 1,
        color: Colors.grey,
      )
    ]
  );
}
