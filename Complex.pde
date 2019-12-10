int w;
int h;
void setup() {
  size(500, 500, P2D);
  w = width;
  h = height;
  stroke(255);
  smooth(9);
}
void draw() {
  if (mousePressed) {
    if (mouseButton == LEFT) {
      if (anima < 0.999)
        anima += 0.01;
      if (anima2 <= 0)
        anima2 += 0.005;
    }
    if (mouseButton == RIGHT) {
      if (anima > 0.001)
        anima -= 0.01;
      if (anima2 > -0.5)
        anima2 -= 0.005;
    }
  }
  float mx = mouseX - w/2;
  float my = mouseY - h/2;
  translate(w/2, h/2);

  background(51);

  strokeWeight(1);
  stroke(100);
  line(-w, 0, w, 0);
  line(0, -h, 0, h);

  strokeWeight(1);
  stroke(100);

  float gap = 5;

  for (float y = -h; y<h; y+=50) {
    for (float i=-w; i<w-gap; i+=gap) {
      //line(i, y, i+gap, y);
      line(complex(i, y).x, complex(i, y).y, complex(i+gap, y).x, complex(i+gap, y).y);
    }
  }
  for (float x = -w; x<w; x+=50) {
    for (float i=-h; i<h-gap; i+=gap) {
      //line(x, i, x, i+gap);
      line(complex(x, i).x, complex(x, i).y, complex(x, i+gap).x, complex(x, i+gap).y);
    }
  }

  //drawLine(10, -221, 413, 158);
  stroke(255);
  strokeWeight(3);
  drawTri(new PVector(-50+mx, 50+my), new PVector(mx, -50+my), new PVector(50+mx, 50+my));
  //saveFrame("data/####.tif");
}

void drawLine(float x1, float y1, float x2, float y2) {
  float line_gap = 0.02;
  for (float t=0; t<1-line_gap; t+=line_gap) {
    float newx = lerp(x1, x2, t);
    float newy = lerp(y1, y2, t);

    float newx2 = lerp(x1, x2, t+line_gap);
    float newy2 = lerp(y1, y2, t+line_gap);
    line(newx, newy, newx2, newy2);

    PVector comp1 = complex(newx, newy);
    PVector comp2 = complex(newx2, newy2);
    line(comp1.x, comp1.y, comp2.x, comp2.y);
  }
}
void drawTri(PVector p1, PVector p2, PVector p3) {
  drawLine(p1.x, p1.y, p2.x, p2.y);
  drawLine(p2.x, p2.y, p3.x, p3.y);
  drawLine(p3.x, p3.y, p1.x, p1.y);
}

float anima = 0;
float anima2 = -0.5;

PVector complex(float x, float y) {
  float angle = atan2(y, x);
  PVector cv = new PVector();

  cv = new PVector(x, y);
  cv.rotate(angle * anima);

  return cv;
}
PVector complex2(float x, float y) {
  float angle = atan2(y, x);
  PVector cv = new PVector(x, y);
  cv.rotate(angle * anima2);
  return cv;
}
PVector complex3(float x, float y) {
  float angle = atan2(y, x);
  PVector cv = new PVector(x, y);
  cv.rotate(angle * anima2);
  cv.mult(-1);
  return cv;
}
