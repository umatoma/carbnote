import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

abstract class ImageClassifier {
  ImageClassifier() {
    _interpreterOptions = InterpreterOptions();
    _interpreterOptions.threads = 4;
  }

  Interpreter interpreter;
  InterpreterOptions _interpreterOptions;
  List<int> _inputShape;
  List<int> _outputShape;
  TensorBuffer _outputBuffer;
  TfLiteType _outputType = TfLiteType.uint8;
  SequentialProcessor<TensorBuffer> _probabilityProcessor;

  List<String> _labels;

  NormalizeOp get preProcessNormalizeOp;
  NormalizeOp get postProcessNormalizeOp;

  Future<void> load({
    @required Uint8List model,
    @required List<String> labels,
  }) async {
    // load model
    interpreter = Interpreter.fromBuffer(
      model,
      options: _interpreterOptions,
    );

    _inputShape = interpreter.getInputTensor(0).shape;
    _outputShape = interpreter.getOutputTensor(0).shape;
    _outputType = interpreter.getOutputTensor(0).type;

    _outputBuffer = TensorBuffer.createFixedSize(_outputShape, _outputType);
    _probabilityProcessor =
        TensorProcessorBuilder().add(postProcessNormalizeOp).build();

    // set labels
    _labels = labels;
  }

  void close() {
    interpreter?.close();
  }

  Map<String, double> predict(File file) {
    assert(interpreter != null);

    final inputImage = _loadImage(file);
    interpreter.run(
      inputImage.buffer,
      _outputBuffer.getBuffer(),
    );
    final Map<String, double> labelValueMap = TensorLabel.fromList(
      _labels,
      _probabilityProcessor.process(_outputBuffer),
    ).getMapWithFloatValue();
    return labelValueMap;
  }

  TensorImage _loadImage(File file) {
    final image = TensorImage.fromFile(file);
    final int cropSize = min(image.height, image.width);
    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(
          _inputShape[1],
          _inputShape[2],
          ResizeMethod.NEAREST_NEIGHBOUR,
        ))
        .add(preProcessNormalizeOp)
        .build()
        .process(image);
  }
}

class FloatImageClassifier extends ImageClassifier {
  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
