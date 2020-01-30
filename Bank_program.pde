Knap exits =  new Knap(10, 10, 20, 20);
Knap indsaetA = new Knap(80, 50, 140, 50);
Knap fjernA = new Knap(80, 120, 140, 50);
Knap indsaetB = new Knap(380, 50, 140, 50);
Knap fjernB = new Knap(380, 120, 140, 50);
int konto1 = 0;
int konto2 = 0;



void setup() {

  // her defineres winduets indstillinger
  size(600, 480);
   surface.setTitle("Bankprogram");
     
//cursor(kind);
}

void draw() {

  // dette sørger for at det er en ny palet der bliver tegnet være gang 
  clear();
  background(230);


  //  det her tegner exit
  exits.tegnknap();
  exits.setTekst("X");

  //dette tegner indsætA knap
  indsaetA.tegnknap();
  indsaetA.setTekst("Indsæt 100 kr");

  //dette tegner fjernA knappen
  fjernA.tegnknap();
  fjernA.setTekst("Fjern 100 kr");


  //det er her at knappen  indsæt B bliver tegnet
  indsaetB.tegnknap();
  indsaetB.setTekst("Indsæt 100 kr");

  // dette er hvor knappen fjern B bliver tegnet
  fjernB.tegnknap();
  fjernB.setTekst("Fjern 100 kr");

  // tegner kasse og twekst til box 1
  fill(255, 255, 255, 0);  
  rect(380, 320, 80, 50);
  fill(0);
  textSize(16);
  text(konto2 + " Kr", 380, 320 + 25);
  text("konto 2", 380, 320 );

  // tegner kasse og twekst til box 2
  fill(255, 255, 255, 0); 
  rect(140, 320, 80, 50);
  fill(0);
  text("konto 1", 140, 320 );
  text(konto1 + " Kr", 140, 320 + 25);

  // her erbliver funktion af indsætA kanppen lavet
  if (indsaetA.knapTrykket) {
    konto1 += 100;
    println("Konto 1: " + konto1);
    indsaetA.knapTrykket = false;
  }
  // her erbliver funktion af fjernA kanppen lavet
  if (fjernA.knapTrykket) {
    konto1 -= 100;
    println("Konto 1: " + konto1);
    fjernA.knapTrykket = false;
  }

  // her erbliver funktion af indsætB kanppen lavet
  if (indsaetB.knapTrykket) {
    konto2 += 100;
    println("Konto 2: " + konto2);
    indsaetB.knapTrykket = false;
  }

  // her erbliver funktion af fjernB kanppen lavet
  if (fjernB.knapTrykket) {
    konto2 -= 100;
    println("Konto 2: " + konto2);
    fjernB.knapTrykket = false;
  }
  
   if (exits.knapTrykket) {
   exit();
  }
}
// tjekker om der er blivet klikket på en knap
void mouseClicked() {
  indsaetB.klik();
  indsaetA.klik();

  fjernA.klik();
  fjernB.klik();

  exits.klik();
}

/**
 * det her er min knappe klasse 
 */
class Knap {

  // Attributter
  boolean knapTrykket = false; /**< der er sand hvis knappen er trykket på og falsk hvis ikke */
  float positionX; /**< der indeholder x-positionen af knappen */
  float positionY; /**< der indeholder y-positionen af knappen */

  float sizeX, sizeY;/**<det her indholder højden og bredten af knappen*/

  /**hojde, der indeholder højde af knappen
   bredde, der indeholder bredde af knappen
   tekst, der indeholder knappens tekst/titel*/

  Knap(int a, int b, int c, int d ) {
    positionX = a;
    positionY = b;
    sizeX = c;
    sizeY = d;
  }
  
  //tjekker om der bliver klikket på knappen
  void klik() {
    if (//mousePressed &&
      mouseX > positionX &&
      mouseX < positionX + sizeX &&
      mouseY > positionY &&
      mouseY < positionY + sizeY) {
      knapTrykket = true;
      println("bruh");
    } else {
      knapTrykket = false;
    }
  }
 
  //sætter teksten på skærmen 
  void setTekst(String tekst) {
    fill(0);
    text(tekst, positionX +(sizeX/8), positionY + (sizeY/2));
  }
  
  //tegn knappen
  void tegnknap() {
    fill(255);
    rect(positionX, positionY, sizeX, sizeY);
  }
}
