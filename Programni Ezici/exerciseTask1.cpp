/* da se suzdade bazov klas.
 * s komponenti X i Y - componenti na tochki.
 * i sus slednite chel funkcii
 * get - dostup do X i get - dostup do Y   (dve)
 * 1 Konstruktor s parametri                (treta cheln funkciq)
 * 1 funkciq (4rta) za vizualizaciq na kordinatite na tochkata
 *
 * Da napravim Proizvoden klas Okrujnost s komponenti
 * 1 danna - Radius
 * i 3 chen funkcii - konstruktor s parametri,
 * get za dostup do radiusa
 * i funkciq koqt izvejda koordinati na centura + radiusa
 *
 * da se sustavi glavna funkciq v koqto da definirame obekt ot proizvodniq klas
 * chrez toq obekt da izvikame funkciqta za vizualizirane*/

#include <iostream>
using namespace std;
//Базов клас за различни превозни средства
class tochka {
    int corX;
    int corY;
public:
    tochka(int x, int y) {
        corX = x;
        corY = y;
    }
    void showCoordinates() {
        cout << "X:" << corX << "\n";
        cout << "Y:" << corY << "\n";
    }
    int getCorX() const {
        return corX;
    }
    int getCorY() const {
        return corY;
    }
};
class circle : public tochka {
    int rad;
public:
    circle(int x, int y, int r) : tochka(x, y) { rad = r; }

    int getRadius() const {
        return rad;
    }
    void showCircle() {
        showCoordinates();
        cout << "Radius:" << rad << endl;
    }
};

int main(){
    circle circleObject(12,53,9);
    circleObject.showCircle();
}
