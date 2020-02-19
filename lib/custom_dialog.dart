import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        //...bottom card part
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("possible money save: 0.013€"),
              Text("possible CO2 save: 2.3kg"),
              Text("renewable energy: 53%"),
              SizedBox(height: 24.0),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text(
                        buttonText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton(
                      onPressed: () {
                        Connection con = new Connection();
                        con.setDishWasherOn();
                      },
                      child: Text(
                        "Start now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
        //...top circlular image part
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              radius: Consts.avatarRadius,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset("assets/logo_black.svg"))
            //Icon(Icons.battery_charging_full,color: Colors.black, size: 50),
          ),
        ),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class Connection {
  String srvUrl = 'api.home-connect.com';
  String haidDishWasher = 'BOSCH-SMS88UI36E-68A40E0EA3B4';
  String dishWasherSettingsUrl = 'https://api.home-connect.com/api/homeappliances/BOSCH-SMS88UI36E-68A40E0EA3B4/settings/BSH.Common.Setting.PowerState';
  String settingKey = 'BSH.Common.Setting.PowerState';
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Authorization': 'Bearer eyJ4LWVudiI6IlBSRCIsImFsZyI6IlJTMjU2IiwieC1yZWciOiJFVSIsImtpZCI6IlMxIn0.eyJmZ3JwIjpbXSwic3ViIjoiZjk1OWU2YTUtODg4Ni00NjBiLWFlNjgtMDZkNzYwZjk2NjEyIiwiYXVkIjoiQ0ExMjlFOEE2NTkyOTUyQjNCOUNBRjdFQkM2OUEwMzc2NEU3M0Q1MUVEMzNGQ0ZFNTk0ODc4NTlCRkNDQUZFQyIsImF6cCI6IkNBMTI5RThBNjU5Mjk1MkIzQjlDQUY3RUJDNjlBMDM3NjRFNzNENTFFRDMzRkNGRTU5NDg3ODU5QkZDQ0FGRUMiLCJzY29wZSI6WyJDb29rUHJvY2Vzc29yLU1vbml0b3IiLCJEcnllci1TZXR0aW5ncyIsIldhc2hlci1Db250cm9sIiwiRHJ5ZXItTW9uaXRvciIsIlNldHRpbmdzIiwiSWRlbnRpZnlBcHBsaWFuY2UiLCJXYXNoZXItU2V0dGluZ3MiLCJDb2ZmZWVNYWtlciIsIldhc2hlciIsIkNvb2tQcm9jZXNzb3ItU2V0dGluZ3MiLCJIb2ItU2V0dGluZ3MiLCJPdmVuLU1vbml0b3IiLCJIb29kLUNvbnRyb2wiLCJXYXNoZXJEcnllci1Nb25pdG9yIiwiT3Zlbi1TZXR0aW5ncyIsIkNvZmZlZU1ha2VyLU1vbml0b3IiLCJNb25pdG9yIiwiSG9iLU1vbml0b3IiLCJXYXNoZXJEcnllci1Db250cm9sIiwiRGlzaHdhc2hlci1Db250cm9sIiwiUmVmcmlnZXJhdG9yLUNvbnRyb2wiLCJEaXNod2FzaGVyIiwiRHJ5ZXItQ29udHJvbCIsIkNsZWFuaW5nUm9ib3QtQ29udHJvbCIsIldpbmVDb29sZXIiLCJGcmVlemVyLU1vbml0b3IiLCJXYXNoZXJEcnllciIsIlJlZnJpZ2VyYXRvci1Nb25pdG9yIiwiQ29va1Byb2Nlc3NvciIsIkZyZWV6ZXIiLCJGcmVlemVyLVNldHRpbmdzIiwiV2luZUNvb2xlci1Db250cm9sIiwiV2luZUNvb2xlci1TZXR0aW5ncyIsIkRpc2h3YXNoZXItU2V0dGluZ3MiLCJIb29kIiwiRHJ5ZXIiLCJGcmlkZ2VGcmVlemVyLU1vbml0b3IiLCJDbGVhbmluZ1JvYm90LVNldHRpbmdzIiwiUmVmcmlnZXJhdG9yIiwiUmVmcmlnZXJhdG9yLVNldHRpbmdzIiwiRGlzaHdhc2hlci1Nb25pdG9yIiwiQ29mZmVlTWFrZXItU2V0dGluZ3MiLCJGcmlkZ2VGcmVlemVyLVNldHRpbmdzIiwiQ2xlYW5pbmdSb2JvdC1Nb25pdG9yIiwiV2luZUNvb2xlci1Nb25pdG9yIiwiRnJlZXplci1Db250cm9sIiwiQ29mZmVlTWFrZXItQ29udHJvbCIsIldhc2hlci1Nb25pdG9yIiwiSG9vZC1Nb25pdG9yIiwiSG9vZC1TZXR0aW5ncyIsIkZyaWRnZUZyZWV6ZXItQ29udHJvbCIsIkNvb2tQcm9jZXNzb3ItQ29udHJvbCIsIldhc2hlckRyeWVyLVNldHRpbmdzIl0sImlzcyI6IkVVOlBSRDowNyIsImV4cCI6MTU4MjIwMDk1OSwiaWF0IjoxNTgyMTE0NTU5LCJqdGkiOiJjYmIzMmU0ZS05MzE0LTRmMzgtYjQwMi1hMzAwZWU2YzI3YWEifQ.JwbMXBXhpR5rFIU3SEWFBNnJm2eDkMyLdozrY6P5ptPEpQCE-YtZS_YP4v8_PbM9c6hjEMWIBHDwu40AVxCySCVi4_KTc-f5UBPZuOaImCJmg7Dh06r20zAg78somKDgcp6veGvrsw02Q06r9cehpQtsiTF1lNpVvVp-sj_CdB_n83v6UyTqEzx1IpdAU8t_nwmpZHi0b_tD7nqd-nUEaEjgPbN-B4nrikQEgjWBGIsyMxUVHbk1T5WG2QBAnEgsivc9vvBtCop_pR9tZKHbeqafAPl5vCWAVPHETry0oezhoaLv4TiMTxtbT_3S4QXfLeNxRoJJ0slisQM3t9_NUQ',
    'Accept': 'application/vnd.bsh.sdk.v1+json',
    'Content-Type': 'application/vnd.bsh.sdk.v1+json'
  };
  String dishWasherActiveProgram = 'https://api.home-connect.com/api/homeappliances/BOSCH-SMS88UI36E-68A40E0EA3B4/programs/active';


  void setDishWasherSetting(String opt) async {
    String json = '{"data": {"key": "BSH.Common.Setting.PowerState", "value": "' +
        opt + '"}}';
    Response response = await put(
        dishWasherSettingsUrl, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(statusCode);
  }


  void startProgramInSeconds(int seconds) async {
    String json = '{"data": {"key": "Dishcare.Dishwasher.Program.Auto2", "options": [{"key": "BSH.Common.Option.StartInRelative", "value": ' +
        seconds.toString() + ', "unit": "seconds"}]}}';

    Response response = await put(
        dishWasherActiveProgram, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(statusCode);
  }

  void setDishWasherOn() {
    setDishWasherSetting('BSH.Common.EnumType.PowerState.On');
  }

  void setDishWasherOff() {
    setDishWasherSetting('BSH.Common.EnumType.PowerState.Off');
  }
}
