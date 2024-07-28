import 'package:flutter/material.dart';

class ShowMyArea extends StatelessWidget {
  String name;
  String desc;
  String latitude;
  String longitude;
  TextStyle nameTextStyle;
  TextStyle descTextStyle;
  TextStyle latLongTextStyle;
  Function() onClickPlace;
  Function() deleteArea;

  ShowMyArea({
    super.key,
    required this.name,
    required this.desc,
    required this.latitude,
    required this.longitude,
    required this.nameTextStyle,
    required this.descTextStyle,
    required this.latLongTextStyle,
    required this.onClickPlace,
    required this.deleteArea,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14, bottom: 14),
      padding: const EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width-30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white, width: 2,),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : $name", style: nameTextStyle,),
                Text("Desc : $desc", style: descTextStyle,),
                const SizedBox(height: 14,),
                Row(
                  children: [
                    Text("lat : $latitude,\t\t\t", style: latLongTextStyle,),
                    Text("lon : $longitude,\t\t", style: latLongTextStyle,),
                    const Icon(Icons.place, size: 28,)
                  ],
                ),
              ],
            ),
            onTap: (){onClickPlace();},
          ),

          GestureDetector(
            child: const Icon(Icons.delete,),
            onTap: ()async{await deleteArea();},
          ),
        ],
      ),
    );
  }
}