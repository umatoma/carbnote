import os

import numpy as np

import tensorflow as tf
assert tf.__version__.startswith('2')

from tflite_model_maker import configs
from tflite_model_maker import ExportFormat
from tflite_model_maker import image_classifier
from tflite_model_maker import ImageClassifierDataLoader
from tflite_model_maker import model_spec

import matplotlib.pyplot as plt

data = ImageClassifierDataLoader.from_folder('/Users/tokahana/workspace/train/images')
train_data, test_data = data.split(0.9)
model = image_classifier.create(train_data, epochs=10)
loss, accuracy = model.evaluate(test_data)
model.export(export_dir='/Users/tokahana/workspace/carbnote/assets/models', export_format=ExportFormat.LABEL)
model.export(export_dir='/Users/tokahana/workspace/carbnote/assets/models', export_format=ExportFormat.TFLITE)

# plt.figure(figsize=(10,10))
# for i, (image, label) in enumerate(data.gen_dataset().unbatch().take(25)):
#   plt.subplot(5,5,i+1)
#   plt.xticks([])
#   plt.yticks([])
#   plt.grid(False)
#   plt.imshow(image.numpy(), cmap=plt.cm.gray)
#   plt.xlabel(data.index_to_label[label.numpy()])
# plt.show()
