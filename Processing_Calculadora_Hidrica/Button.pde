class myButton {
  float x, y, w, h;
  String label;
  PImage image;

  
  myButton(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = "Button";
    this.image = null;
    
  }
  
  void setImage(PImage image) {
    this.image = image;
  }
  
  void setText(String label) {
    this.label = label;
  }
  
  boolean contains(float px, float py) {
    return px >= x && px <= x + w && py >= y && py <= y + h;
  }
  
  
  void draw() {
    noStroke();
    rect(x, y, w, h, 5);
    if (image != null) {
      imageMode(CENTER);
      image(image, x + w/2, y + h/2, w, h);
    }
  }
}
