/**	
 example from nyar4psg modified to demonstrate NyARMultiBoard + NyARMultiBoardMarker by
 Charl P. Botha <http://cpbotha.net/>
 
 updated on 20110305 to use the new P3D / OPENGL adaptation I hacked into NyARMultiBoard,
 and to show framerate in top-left corner. On this machine, P3D is faster.
 
 */

// we want to use the gsvideo camera support stack
import codeanticode.gsvideo.*;
// multiple marker tracking
import jp.nyatla.nyar4psg.*;
// only necessary if you're using the OPENGL renderer (see the size() call in setup())
import processing.opengl.*;

//GSCapture cam;
NyARMultiBoard nya;
PFont font, font2d;
PImage img;

void setup() {
  // our display is 640x480
  size(1280, 720, P3D);

  img = loadImage("video152.jpg");

  colorMode(RGB, 100);
  font=createFont("FFScala", 32);
  font2d = createFont("FFScala", 10);
  // I'm using the GSVideo capture stack, we're capturing at
  // the same size as the display, which should be 640x480
  // on Linux with the Sony PS3 Eye
  // cam=new GSCapture(this, width, height);
  // cam.start();  
  // array of pattern file names, these have to be in the data subdir of this sketch
  String[] patts = {
    "patt.18num", "patt.18cam", "patt.18cam2", "patt.18cam3", "patt.18cam4", "patt.18cam5", 
    "patt.18cam6", "patt.18cam7", "patt.18cam8", "patt.18cam9", "patt.18cam10", "patt.18cam11",
    "patt.18cam12", "patt.18cam13", "patt.18cam14", "patt.18cam15", "patt.18cam16", "patt.18cam17", 
    "patt.18cam18", "patt.18cam19", "patt.18cam20", "patt.18cam21", "patt.18cam22", "patt.18cam23",
    "patt.18cam24"
  };
  // array of corresponding widths in mm
  double[] widths = {
    80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80
  };
  // initialise the NyARMultiBoard
  // the camera parameter file is also in the data subdir
  nya=new NyARMultiBoard(this, width, height, "camera_para.dat", patts, widths);
  print(nya.VERSION);

  // marker detection algorithm parameter
  nya.gsThreshold=120;//(0<n<255) default=110

    // a marker has to be detected with a confidence greater than
  // this threshold for it to be considered a true detection
  nya.cfThreshold=0.4;//(0.0<n<1.0) default=0.4
}

// draw marker corners and also position in text
void drawMarkerPos(int[][] pos2d)
{
  textFont(font, 10.0);
  stroke(100, 0, 0);
  fill(100, 0, 0);

  // draw ellipses at outside corners of marker
  for (int i=0; i<4; i++) {
    ellipse(pos2d[i][0], pos2d[i][1], 5, 5);
  }

  fill(0, 0, 0);
  for (int i=0; i<4; i++) {
    text("("+pos2d[i][0]+","+pos2d[i][1]+")", pos2d[i][0], pos2d[i][1]);
  }
}

// standard processing event handler that's called for display updates
void draw() {
  // we only do something when the camera input is available
  /*if (cam.available() !=true) {
   return;
   }
   
   // get an image from the camera
   cam.read();
   */
  // need to put camera image on screen, so temporarily disable depth testing
  hint(DISABLE_DEPTH_TEST);
  // put webcam image on screen
  image(img, 0, 0);
  hint(ENABLE_DEPTH_TEST);

  // if *any* markers have been detected this will be true
  if (nya.detect(img))
  {
    // going to be doing 2D drawing (drawMarkerPos) so temporarily disable depth testing
    hint(DISABLE_DEPTH_TEST);

    // for all detected markers, draw corner points
    for (int i=0; i < nya.markers.length; i++)
    {
      if (nya.markers[i].detected)
      {
        drawMarkerPos(nya.markers[i].pos2d);
      }
    }

    // depth test back on, we're going to draw 3D YEAH!!
    hint(ENABLE_DEPTH_TEST);

    // for all detected markers:
    for (int i=0; i < nya.markers.length; i++)
    {
      if (nya.markers[i].detected)
      {

        // set the model-view transform to that of the marker
        // this will adapt automatically to P3D or OPENGL renderers
        // HO COMMENTATO LA LINEA SUCCESSIVA PER EVITARE
        //CHE IL VIDEO SI BLOCCHI NON APPENA RILEVA IL MARKER
        //nya.markers[i].beginTransform();

        translate(200, 150, 80);

        // if it's the hiro marker, draw a black cube
        if (i == 0)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 1)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 2)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 3)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 4)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 5)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 6)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 7)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 8)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 9)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 10)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 11)
        {
          stroke(255, 0, 0);
          box(70);
        }
        
        if (i == 12)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 13)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 14)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 15)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 16)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 17)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 18)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 19)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 20)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 21)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 22)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 23)
        {
          stroke(255, 0, 0);
          box(70);
        }
        if (i == 24)
        {
          stroke(255, 0, 0);
          box(70);
        }
        

        /*
        // if it's the Kinjii marker, draw a sphere
         if ( i ==1 )
         {
         stroke(0, 200, 255);
         sphere(30);
         }
         
         // if it's the 18number marker, draw a red cube
         if ( i ==2 )
         {
         fill (255, 0, 0); 
         stroke(0);
         box(50);
         }
         
         // if it's the 7number marker, draw a red sphere
         if ( i ==3 )
         {
         fill (255, 0, 0); 
         stroke(0);
         sphere(40);
         }
         */
        // after drawing marker-relative 3D geometry, we
        // HAVE to end the transform (so now we're back in
        // world space)
        // HO COMMENTATO LA LINEA SUCCESSIVA PER EVITARE
        //CHE IL VIDEO SI BLOCCHI NON APPENA RILEVA IL MARKER
        //nya.markers[i].endTransform();
      }
    }
  }
}
/*
  // display frame rate in the top left of the screen
 // on this Dell E6410 Core i5 laptop:
 // OPENGL: 45 fps
 // P3D: 57 fps
 hint(DISABLE_DEPTH_TEST);
 textFont(font2d, 10.0);
 textMode(SCREEN);
 fill(100, 100, 0);
 text("frame rate = " + frameRate, 10, 10);
 textMode(MODEL);
 hint(ENABLE_DEPTH_TEST);
 */
