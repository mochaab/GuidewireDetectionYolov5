import torch

def load_yolov3_model(model_path, cfg_path):
    model = torch.hub.load('ultralytics/yolov3','yolov3',pretrained=False)
    model.load_darknet_weights(model_path)
    model.cfg = model.cfg.load_from_file(cfg_path)
    return model

weights_path = '/home/nami/Dokumente/DeepLearningProjects/GuidewireDetection/backup/yolov3_custom_train_last.weights'
cfg_path='/home/nami/Dokumente/DeepLearningProjects/GuidewireDetection/cfg/yolov3_custom_test.cfg'

yolov3_model = load_yolov3_model(weights_path,cfg_path)
yolov3_model.eval()