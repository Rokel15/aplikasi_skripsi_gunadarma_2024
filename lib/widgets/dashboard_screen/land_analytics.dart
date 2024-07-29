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
  Color additionalCommentsBorderColor;
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
    required this.additionalCommentsBorderColor,
    required this.analyticResult,
    required this.getResult,
    required this.restartAnalytic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(landAnalyticHead)),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(soilTypeLabel),
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
          child: Text(moistureLevelLabel),
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
          child: Text(pHLevelLabel),
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
          child: Text(additionalCommentsLabel),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: TextFormField(
            controller: additionalCommentsController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: additionalCommentsHintText,
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
              child: Text(submitButtonText),
            ),
            onTap: () => getResult(),
          ),
        ),

        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("restart\t\t"),
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
          child: Text(analyticResult),
        ),
      ],
    );
  }
}