import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';

class LandAnalytics extends StatelessWidget {
  const LandAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text("data")),

          Text("data"),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Soil Type",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
            ),
          ),

          Text("data"),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Moisture Level",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
            ),
          ),

          Text("data"),
          TextFormField(
            decoration: InputDecoration(
              hintText: "PhLevel",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
            ),
          ),

          Text("data"),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Additional Comment",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(
                  color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
                  width: 1.6,),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Center(child: Text("submit"),),

          const SizedBox(height: 20),

          Text("result"),
        ],
      ),
    );
  }
}
