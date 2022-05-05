import 'package:flutter/material.dart';
import 'package:pool/services/funcations/firebaseFuncations.dart';
import 'package:pool/services/providers/pollProvider.dart';
import 'package:pool/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddDecision extends StatefulWidget {
  const AddDecision({Key? key}) : super(key: key);

  @override
  State<AddDecision> createState() => _AddDecisionState();
}

class _AddDecisionState extends State<AddDecision> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PollsProvider>(
        builder: (context, model, child) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const PollsContainer(),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      saveDecsion(model.pollsWeights, model.pollTitle);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Decision Uploaded'),
                        ),
                      );
                    },
                    child: const Text('Upload Decision'),
                  )
                  // ElevatedButton(onPressed: () {}, child: Text('Add A Poll'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
