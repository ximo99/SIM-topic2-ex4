// Author:
// Ximo Casanova

// Description of the problem:
// Water splash

// Display values:
final boolean FULL_SCREEN = false;
final int DRAW_FREQ = 50;    // Draw frequency (Hz or Frame-per-second)
int DISPLAY_SIZE_X = 1000;   // Display width (pixels)
int DISPLAY_SIZE_Y = 600;    // Display height (pixels)

// Parameters of the numerical integration:
final float SIM_STEP = 0.06;   // Simulation time-step (s)

// Draw values:
final int [] BACKGROUND_COLOR = {200, 200, 255};

// Parameters of the problem: 
final float Gc    = 9.801;  // Gravity constant (m/(s*s))
final PVector G   = new PVector(0.0, Gc);  // Acceleration due to gravity (m/(s*s))

PVector origenBall, origenSplash;

// Classes:
Ball ball;
ParticleSystem ps;

void settings()
{
  size(DISPLAY_SIZE_X, DISPLAY_SIZE_Y);
}

void setup()
{
  initSimulation();
}

void initSimulation()
{
  background(BACKGROUND_COLOR[0], BACKGROUND_COLOR[1], BACKGROUND_COLOR[2]);
  
  origenBall = new PVector(width/2.0, height/4.0);
  ball = new Ball(origenBall);
  
  origenSplash = new PVector(width/2.0, height/2.0);
  ps = new ParticleSystem(origenSplash);
}

void draw() {
  background(BACKGROUND_COLOR[0], BACKGROUND_COLOR[1], BACKGROUND_COLOR[2]);
  
  ball.run();
  
  if (ball.s.y+ball.r > height/2.0 && ball.s.y+ball.r < height/10.0*6 && ball.v.y > 10) {
    ps.addParticle();
  }
  
  ps.run();
  drawStaticEnvironment();
}

// Water
void drawStaticEnvironment()
{
  fill(0);
  textSize(20);
  text("Pulse R para reiniciar el sistema. ", 50, 50);
  
  noStroke();
  fill(0, 196, 255, 100);
  rect(0, height/2, width, height);
}

// Modify the simulation by pressing the indicated keys
void keyPressed()
{
  switch(key)
  {  
    case 'r':
    case 'R':
      reset();
    break;
      
    default:
      break;
  }
}

void mousePressed()
{
  PVector origenBall = new PVector(mouseX, mouseY);
  origenSplash = new PVector(mouseX, height/2.0);
  
  ball = new Ball(origenBall);
  ps = new ParticleSystem(origenSplash);
}

// System reset
void reset()
{
  origenBall = new PVector(width/2.0, height/4.0);
  origenSplash = new PVector(width/2.0, height/2.0);
  
  ball = new Ball(origenBall);
  ps = new ParticleSystem(origenSplash);
}

// Stop system
void stop()
{
  exit();
}
