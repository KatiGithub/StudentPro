import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studio_projects/models/user.dart';
import 'package:studio_projects/shared/utils/datetime_utils.dart';

class UserInformationDisplay extends StatefulWidget {
  User user;

  UserInformationDisplay(this.user);

  @override
  _UserInformationDisplayState createState() => _UserInformationDisplayState();
}

class _UserInformationDisplayState extends State<UserInformationDisplay> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Close",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
        elevation: 100,
        content: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "User Information",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 7,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.switch_account),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${widget.user.firstName} ${widget.user.lastName}")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.cake),
                        SizedBox(width: 10,),
                        Text(DateTimeUtils.getDateTextFromEpoch(widget.user.dateOfBirth!))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.school),
                        SizedBox(width: 10,),
                        Text(widget.user.university!.name)
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Container(),
              )
            ],
          ),
        ));
  }
}
