import 'package:flutter/material.dart';

class InputDataDialog extends StatelessWidget {
  TextEditingController inputNameController;
  TextEditingController inputDescController;
  TextEditingController inputLatController;
  TextEditingController inputLonController;
  TextStyle textStyle;
  Function() addData;

  InputDataDialog({
    super.key,
    required this.inputNameController,
    required this.inputDescController,
    required this.inputLatController,
    required this.inputLonController,
    required this.textStyle,
    required this.addData,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Center(child: Text("add location",)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      shadowColor: Colors.white,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name :",),
              TextField(
                controller: inputNameController,
                style: textStyle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              const Text("Desc :",),
              TextField(
                controller: inputDescController, maxLines: 2,
                style: textStyle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              const Text("lat, lonn :",),
              TextField(
                controller: inputLatController,
                style: textStyle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: inputLonController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18),),
                    borderSide: BorderSide(color: Colors.white, width: 1.6,),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.add_task_rounded, size: 34,),
                    onTap: (){addData();},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}