import 'package:flutter/material.dart';
import 'package:mars_rover/models/camera_rover.dart';

class CamerasRover with ChangeNotifier {
  List<CameraRover> _items = [
    CameraRover(
      icon: Icon(Icons.control_camera_sharp),
      label: 'NavCams',
      title: 'Navigation Cameras',
      description: 'Two color stereo Navigation Cameras, called Navcams, help e'
          'ngineers navigate Perseverance safely, particularly when the rover o'
          'perates autonomously, making its own navigation decisions without co'
          'nsulting controllers on Earth. Located up high on the rover\'s mast,'
          ' these two cameras help engineers drive the rover around Mars. They '
          'can see an object as small as a golf ball from 82 feet (25 meters) a'
          'way. Before Perseverance drives blind, the navigation cameras initia'
          'lly help ensure a safe path. Blind-drive mode occurs when engineers '
          'command the rover to drive a certain distance in a certain direction'
          ', and the rover\'s computer brains calculate distance from wheel rot'
          'ations without looking or checking for wheel slippage',
    ),
    CameraRover(
      icon: Icon(Icons.photo_camera_back),
      label: 'MastCams',
      title: 'Mastcam-Z',
      description: 'The Mastcam-Z is the name of the mast-mounted camera system'
          ' that is equipped with a zoom function on the Perseverance rover. Ma'
          'stcam-Z has cameras that can zoom in, focus, and take 3D pictures an'
          'd video at high speed to allow detailed examination of distant objec'
          'ts. Think of Mastcam-Z as the Perseverance rover\'s main eyes. It is'
          ' located near the top of the rover\'s mast (its head). It\'s a camer'
          'a system, and it has a Zoom capability - Z for the mark of zoom! Wha'
          't would you call it but Mastcam-Z?',
    ),
    CameraRover(
      icon: Icon(Icons.camera_outlined),
      label: 'HazCams',
      title: 'Hazard Avoidance Cameras',
      description: 'Perseverance carries six newly developed Hazard Detection C'
          'ameras, called HazCams: four on the front and two on the rear of the'
          ' rover body. HazCams detect hazards to the front and back pathways o'
          'f the rover, such as large rocks, trenches, or sand dunes. Engineers'
          ' also use the front HazCams to see where to move the robotic arm to '
          'take measurements, photos, and collect rock and soil samples. When d'
          'riving, the rover stops frequently to take new stereo images of the '
          'path ahead to evaluate potential hazards. The 3D views give Mars 202'
          '0 the ability to make its own decisions about where to drive without'
          ' consulting on every move with the rover team on Earth.',
    ),
    CameraRover(
      icon: Icon(Icons.camera_rounded),
      label: 'SuperCam',
      title: 'SuperCam',
      description: 'SuperCam is a superhero for making discoveries on Mars! Its'
          ' cameras have super vision, and its spectrometers have super senses '
          'for identifying the chemical makeup of Martian rocks and soil (regol'
          'ith) that could be related to past life on Mars. SuperCam can see ac'
          'ross great distances to measure targets not reachable by the Perseve'
          'rance rover\'s other tools. It\'s an improved version of the ChemCam'
          ' laser on Mars rover Curiosity: SuperCam can additionally analyze mi'
          'nerals and molecules, and take color instead of only black-and-white'
          ' pictures.',
    ),
    CameraRover(
      icon: Icon(Icons.center_focus_weak),
      label: 'SkyCam',
      title: 'SkyCam',
      description: 'SkyCam is a sky-facing camera aboard NASA\'s Perseverance M'
          'ars rover. As part of the Mars Environmental Dynamics Analyzer (MEDA'
          '), the rover\'s set of weather instruments, SkyCam will take images '
          'and video of clouds passing in the Martian sky.',
    ),
  ];

  List<CameraRover> get items => [..._items];
}
