/* @pjs preload="data/image.jpg"; */

//©Byungwook Yoon

PImage originalImage;
PImage editedImage;

int windowWidth = 400;
int windowHeight = 400;



void setup() {
  frameRate(100);
  size(windowWidth, windowHeight);

  originalImage = loadImage("data/image.jpg");
  editedImage = createImage(windowWidth, windowHeight, RGB);

  windowWidth = originalImage.width;
  windowHeight = originalImage.height;

  image(originalImage, 0, 0);
}

void draw() {
  loadPixels();

  color colorSwap;

  //move the snake to the right
  for (int i=0; i<windowHeight/2; i++) {
    if (i%2==0) {
      for (int j=windowWidth-i-1; j>i-1; j--) {
        if (j<=windowWidth-i-1 && j>i) {
          colorSwap = pixels[j + i*windowWidth];
          pixels[j + i*windowWidth] = pixels[j-1 + i*windowWidth];
          pixels[j-1 + i*windowWidth] = colorSwap;
        }

        //move the snake downwards
        else if (j==i) {
          for (int k=i+1; k<windowHeight-i; k++) {
            if (k!=windowHeight-i-1) {
              colorSwap = pixels[windowWidth-1-j + k*windowWidth];
              pixels[windowWidth-1-j + k*windowWidth] = pixels[j + i*windowWidth];
              pixels[j + i*windowWidth] = colorSwap;
            }

            //move the snake to the left
            else {
              for (int m=k; m>=i; m--) {
                if (m!=i) {
                  colorSwap = pixels[m + k*windowWidth];
                  pixels[m + k*windowWidth] = pixels[j + i*windowWidth];
                  pixels[j + i*windowWidth] = colorSwap;
                }

                //move the snake up
                else {
                  for (int n=k; n>i; n--) {
                    colorSwap = pixels[i + n*windowWidth];
                    pixels[i + n*windowWidth] = pixels[j + i*windowWidth];
                    pixels[j + i*windowWidth] = colorSwap;
                  }
                }
              }
            }
          }
        }
      }
    }
    else {
      for (int j=i; j<windowWidth-1-i; j++) {
        if (j<=windowWidth-i-1) {
          colorSwap = pixels[j + i*windowWidth];
          pixels[j + i*windowWidth] = pixels[(j+1) + i*windowWidth];
          pixels[(j+1) + i*windowWidth] = colorSwap;
        }

        //move the snake downwards
        else if (j==windowWidth-i-1) {
          for (int k=i+1; k<windowHeight-i; k++) {
            if (k!=windowHeight-i-1) {
              colorSwap = pixels[windowWidth-1-j + k*windowWidth];
              pixels[windowWidth-1-j + k*windowWidth] = pixels[j + i*windowWidth];
              pixels[j + i*windowWidth] = colorSwap;
            }

            //move the snake to the right
            else {
              for (int m=k; m>=i; m--) {
                if (m!=i) {
                  colorSwap = pixels[m + k*windowWidth];
                  pixels[m + k*windowWidth] = pixels[j + i*windowWidth];
                  pixels[j + i*windowWidth] = colorSwap;
                }

                //move the snake up
                else {
                  for (int n=k; n>i; n--) {
                    colorSwap = pixels[i + n*windowWidth];
                    pixels[i + n*windowWidth] = pixels[j + i*windowWidth];
                    pixels[j + i*windowWidth] = colorSwap;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  updatePixels();
}

void mouseReleased() {
  originalImage = loadImage("image.jpg");
  editedImage = createImage(windowWidth, windowHeight, RGB);
  image(originalImage, 0, 0);
}

