var w;
var h;
function setup() {
    createCanvas(500, 500);
    w = width;
    h = height;
    stroke(255);
}
function draw() {
    if (mouseIsPressed) {
        if (mouseButton == LEFT)
            if (anima < 0.99)
                anima += 0.01;
        if (mouseButton == RIGHT)
            if (anima > 0)
                anima -= 0.01;
    }
    var mx = mouseX - w / 2;
    var my = mouseY - h / 2;
    translate(w / 2, h / 2);

    background(51);

    strokeWeight(1);
    stroke(100);
    line(-w, 0, w, 0);
    line(0, -h, 0, h);

    strokeWeight(1);
    stroke(100);

    var gap = 5;

    for (var y = -h; y < h; y += 50) {
        for (var i = -w; i < w - gap; i += gap) {
            //line(i, y, i+gap, y);
            line(complex(i, y).x, complex(i, y).y, complex(i + gap, y).x, complex(i + gap, y).y);
        }
    }
    for (var x = -w; x < w; x += 50) {
        for (var i = -h; i < h - gap; i += gap) {
            //line(x, i, x, i+gap);
            line(complex(x, i).x, complex(x, i).y, complex(x, i + gap).x, complex(x, i + gap).y);
        }
    }

    //drawLine(10, -221, 413, 158);
    stroke(255);
    strokeWeight(3);
    drawTri(createVector(-50 + mx, 50 + my), createVector(mx, -50 + my), createVector(50 + mx, 50 + my));
    //saveFrame();
}

function drawLine(x1, y1, x2, y2) {
    var line_gap = 0.02;
    for (var t = 0; t < 1 - line_gap; t += line_gap) {
        var newx = lerp(x1, x2, t);
        var newy = lerp(y1, y2, t);

        var newx2 = lerp(x1, x2, t + line_gap);
        var newy2 = lerp(y1, y2, t + line_gap);
        line(newx, newy, newx2, newy2);
        var comp1 = complex(newx, newy);
        var comp2 = complex(newx2, newy2);
        line(comp1.x, comp1.y, comp2.x, comp2.y);
    }
}
function drawTri(p1, p2, p3) {
    drawLine(p1.x, p1.y, p2.x, p2.y);
    drawLine(p2.x, p2.y, p3.x, p3.y);
    drawLine(p3.x, p3.y, p1.x, p1.y);
}

var anima = 0.0;

function complex(x, y) {
    var angle = atan2(y, x);
    var cv = createVector(x, y);
    cv.rotate(angle * anima);
    return cv;
}