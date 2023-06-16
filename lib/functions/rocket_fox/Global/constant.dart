// ignore_for_file: prefer_const_constructors

/// SCORE Variables calculated in function [startGame] in [GamePage]
double score = 0;
double topScore = 0;

/// [Bird] Variables
double yAxis = 0;
double birdWidth = 0.19;
double birdHeight = 0.19;

/// Variables to calculate bird movements function [startGame] in [GamePage]
double time = 0;
double height = 0;
double gravity = -3.9; // How strong the Gravity
double velocity = 2.5; // How strong the jump
double initialHeight = yAxis;
bool gameHasStarted = false;

/// [Barrier] Variables
List<double> barrierX = [1.5, 3.4];
double barrierWidth = 0.5;
List<List<double>> barrierHeight = [
  [0.6, 0.4],
  [0.4, 0.6],
];
double barrierMovement = 0.05;

/// Screen Boundary
double screenEnd = -1.9;
double screenStart = 3.5;

/// audio
