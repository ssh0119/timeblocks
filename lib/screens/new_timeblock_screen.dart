import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timeblocks/providers/form_provider.dart';
import 'package:timeblocks/validators/timeblock_validator.dart';
import 'package:timeblocks/models/timeblock.dart';
import 'package:timeblocks/repositories/timeblocks.dart';

class NewTimeblockScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  NewTimeblockScreen({super.key});

  _updateFormProvider(WidgetRef ref, String fieldName, dynamic fieldValue) {
    ref.read(formProvider.notifier).updateFormValue(fieldName, fieldValue);
  }

  void _saveTimeblock(WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      _updateFormProvider(ref, 'isLoading', true);
      _formKey.currentState!.save();

      final form = ref.watch(formProvider);
      Timeblock newTimeblock = Timeblock(name: form['name']);

      int id = await TimeblocksRepository().addTimeblock(newTimeblock);
      print('inserted with id $id');
      _updateFormProvider(ref, 'isLoading', false);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(formProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New timeblock'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) => TimeblockValidator.isValidName(value),
                onSaved: (value) {
                  _updateFormProvider(ref, 'name', value);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: form['isLoading']
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: form['isLoading']
                        ? null
                        : () {
                            _saveTimeblock(ref);
                          },
                    child: form['isLoading']
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
