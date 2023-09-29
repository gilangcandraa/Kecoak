PImage cocroachImage;
ArrayList<Cocroach> cocroaches = new ArrayList<Cocroach>();
boolean mousePressedLastFrame = false; // Menyimpan status mouse pada frame sebelumnya

void setup() {
  size(600, 600);
  cocroachImage = loadImage("cocroach.png");
}

void draw() {
  background(220);
  
  for (Cocroach cocroach : cocroaches) {
    cocroach.update();
    cocroach.display();
  }
  
  // Cek apakah mouse ditekan sekarang
  boolean mousePressedNow = mousePressed;
  
  // Jika mouse ditekan sekarang dan tidak ditekan pada frame sebelumnya, tambahkan objek
  if (mousePressedNow && !mousePressedLastFrame) {
    cocroaches.add(new Cocroach(mouseX, mouseY));
  }
  
  // Simpan status mouse untuk frame berikutnya
  mousePressedLastFrame = mousePressedNow;
}

class Cocroach {
  float x, y;
  float xSpeed, ySpeed;
  float radius = 40; // Sesuaikan ukuran dengan gambar cocroach
  float angle = 0; // Menyimpan sudut rotasi

  Cocroach(float x, float y) {
    this.x = x;
    this.y = y;
    xSpeed = random(-2, 2);
    ySpeed = random(-2, 2);
  }
  
  void update() {
    x += xSpeed;
    y += ySpeed;
    
    // Menghitung sudut rotasi berdasarkan arah gerak
    angle = atan2(ySpeed, xSpeed);
    
    // Bounce off walls
    if (x < 0 || x > width) {
      xSpeed *= -1;
    }
    if (y < 0 || y > height) {
      ySpeed *= -1;
    }
  }
  
  void display() {
    // Gambar cocroach dengan rotasi
    pushMatrix();
    translate(x, y);
    rotate(angle); // Memutar gambar sesuai sudut
    image(cocroachImage, -radius / 2, -radius / 2, radius, radius);
    popMatrix();
  }
}
