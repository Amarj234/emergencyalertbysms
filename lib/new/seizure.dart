import 'package:flutter/material.dart';

class SeizurePage extends StatelessWidget {
  const SeizurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What are the warning signs of epilepsy?',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:const EdgeInsets.all(10),
             child:const Text(
                  'Temporary confusion—often described as a “fuzzy” feeling A staring spell. Uncontrollable jerking movements of the arms and legs. Loss of consciousness or awareness Psychic symptoms—out-of-body feelings or not feeling “in the moment Memory lapses')
              ),
              // Container(
              //   padding:const EdgeInsets.all(10),
              //   child:const Text('There are many types of seizures, which range in symptoms and severity. Seizure types vary by where in the brain they begin and how far they spread. Most seizures last from 30 seconds to two minutes. A seizure that lasts longer than five minutes is a medical emergency.'),
              // ),
              // Container(
              //   padding:const EdgeInsets.all(10),
              //   child:const Text('Seizures are more common than you might think. Seizures can happen after a stroke, a closed head injury, an infection such as meningitis or another illness. Many times, though, the cause of a seizure is unknown.'),
              // ),
              // Container(
              //   padding:const EdgeInsets.all(10),
              //   child:const Text('Most seizure disorders can be controlled with medication, but management of seizures can still have a significant impact on your daily life. The good news is that you can work with your doctor to balance seizure control and medication side effects.'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
