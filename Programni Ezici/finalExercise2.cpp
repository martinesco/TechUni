/* da se definira klas tochka s X i Y
 konstruktor s parametri za inicializaciq
 get za X i Y

 klas Okrujnost nasledqvasht klas tocha s
 radius, construktor s parametri za inicializaciq
 get za dostup do radiusa

 da se predefinira operaciq Otmestvane nalqvo za izvejdane na dannite na okrujnsotta
 da se suzdade glavna funkciq v koqto se definira dinamichen obekt ot klas okrujnost
 da se izvedat dannite za okrujnostta
 */
#include <iostream>

using namespace std;

class point {
    int corX, corY;
public:
    point(int x, int y) {
        corX = x;
        corY = y;
    }

    int getX() const {
        return corX;
    }

    int getY() const {
        return corY;
    }
};

class circle : public point {
    int rad;
public:
    circle(int x, int y, int r) : point(x, y) {
        rad = r;
    }

    int gerRadius() {
        return rad;
    }

    friend ostream &operator<<(ostream &obj1, circle &obj2); //asd
};

ostream &operator << (ostream &obj1, circle &obj2) {    //asd
    cout << "\n";
    cout << "x = ";
    obj1 << obj2.getX() << "\n";
    cout << "y = ";
    obj1 << obj2.getY() << "\n";
    cout << "r = ";
    obj1 << obj2.gerRadius() << "\n";
    return obj1;
}

int main() {

    circle circle1(3, 4, 5);
    cout << "asd";
    cout << circle1;

    return 0;
}