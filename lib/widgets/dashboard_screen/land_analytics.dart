import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_aplikasi_shallot_farming_decision_makers/providers/global_provider.dart';

class LandAnalytics extends StatelessWidget{
  String landAnalyticHead;
  String submitButtonText;
  String soilTypeLabel;
  String moistureLevelLabel;
  String pHLevelLabel;
  String soilType;
  String moistureLevel;
  String pHLevel;
  List<DropdownMenuItem<String>> soilTypeItems;
  List<DropdownMenuItem<String>> moistureLevelItems;
  List<DropdownMenuItem<String>> pHLevelItems;
  Function(String val) onChangedSoilType;
  Function(String val) onChangedMoistureLevel;
  Function(String val) onChangedPHLevel;
  String additionalCommentsLabel;
  TextEditingController additionalCommentsController;
  String additionalCommentsHintText;
  String analyticResult;
  Function() getResult;
  Function() restartAnalytic;

  LandAnalytics({
    super.key,
    required this.landAnalyticHead,
    required this.submitButtonText,
    required this.soilTypeLabel,
    required this.moistureLevelLabel,
    required this.pHLevelLabel,
    required this.soilType,
    required this.moistureLevel,
    required this.pHLevel,
    required this.soilTypeItems,
    required this.moistureLevelItems,
    required this.pHLevelItems,
    required this.onChangedSoilType,
    required this.onChangedMoistureLevel,
    required this.onChangedPHLevel,
    required this.additionalCommentsLabel,
    required this.additionalCommentsController,
    required this.additionalCommentsHintText,
    required this.analyticResult,
    required this.getResult,
    required this.restartAnalytic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            landAnalyticHead,
            style: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            soilTypeLabel,
            style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white)
          ),
          child: DropdownButton(
            underline: Container(),
            icon: const SizedBox.shrink(),
            value: soilType,
            items: soilTypeItems,
            onChanged: (String? val) => onChangedSoilType(val!),
          ),
        ),

        const SizedBox(height: 20),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            moistureLevelLabel,
            style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white)
          ),
          child: DropdownButton(
            icon: const SizedBox.shrink(),
            underline: Container(),
            value: moistureLevel,
            items: moistureLevelItems,
            onChanged: (String? val) => onChangedMoistureLevel(val!),
          ),
        ),

        const SizedBox(height: 20,),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            pHLevelLabel,
            style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white)
          ),
          child: DropdownButton(
            icon: const SizedBox.shrink(),
            underline: Container(),
            value: pHLevel,
            items: pHLevelItems,
            onChanged: (String? val) => onChangedPHLevel(val!),
          ),
        ),

        const SizedBox(height: 20),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            additionalCommentsLabel,
            style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: TextFormField(
            controller: additionalCommentsController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: additionalCommentsHintText,
              hintStyle: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(color: Provider.of<GlobalProvider>(context, listen: false).mainColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(color: Provider.of<GlobalProvider>(context, listen: false).mainColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(18),),
                borderSide: BorderSide(color: Provider.of<GlobalProvider>(context, listen: false).mainColor, width: 2),
              ),
            ),
          ),
        ),

        const SizedBox(height: 34),

        Center(
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Provider.of<GlobalProvider>(context, listen: false).mainColor,
              ),
              child: Text(
                submitButtonText,
                style: Provider.of<GlobalProvider>(context, listen: false).roboto16Bold,
              ),
            ),
            onTap: () => getResult(),
          ),
        ),

        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "restart\t\t",
              style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
            ),
            GestureDetector(
              child: const Icon(Icons.restart_alt, size: 28,),
              onTap: (){restartAnalytic();},
            ),
            const SizedBox(width: 18,),
          ],
        ),

        const SizedBox(height: 20),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            analyticResult,
            style: Provider.of<GlobalProvider>(context, listen: false).roboto16SemiBold,
          ),
        ),
      ],
    );
  }
}