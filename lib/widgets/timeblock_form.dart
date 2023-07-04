import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timeblocks/models/timeblock.dart';
import 'package:timeblocks/providers/form_provider.dart';
import 'package:timeblocks/providers/timeblocks_provider.dart';
import 'package:timeblocks/validators/timeblock_validator.dart';
import 'package:timeblocks/widgets/interval_input.dart';

const initialIntervalSettings = {'hours': 10, 'minutes': 24, 'seconds': 30};

class TimeblockForm extends ConsumerStatefulWidget {
  const TimeblockForm({super.key});

  @override
  ConsumerState<TimeblockForm> createState() => _TimeblockFormState();
}

class _TimeblockFormState extends ConsumerState<TimeblockForm> {
  final _formKey = GlobalKey<FormState>();
  var intervalInputs = [initialIntervalSettings];

  _updateFormProvider(WidgetRef ref, String fieldName, dynamic fieldValue) {
    ref.read(formProvider.notifier).updateFormValue(fieldName, fieldValue);
  }

  void _saveTimeblock(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      _updateFormProvider(ref, 'isLoading', true);
      _formKey.currentState!.save();

      final form = ref.watch(formProvider);
      Timeblock newTimeblock = Timeblock(name: form['name']);

      await ref.read(timeblocksProvider.notifier).insertTimeblock(newTimeblock);
      _updateFormProvider(ref, 'isLoading', false);

      if (context.mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(context) {
    final form = ref.watch(formProvider);

    return Form(
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
          Column(
            children: intervalInputs.asMap().keys.toList().map((index) {
              return IntervalInput(
                intervalSetting: intervalInputs[index],
                index: index,
              );
            }).toList(),
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
                        _saveTimeblock(context, ref);
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
    );
  }
}
