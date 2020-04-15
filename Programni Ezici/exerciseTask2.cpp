/* da se suzdade clas Tochka (NQMA DUBATA BAZOV) s danni X i Y
 * i konstruktor BEZ parametri
 * dve get Funkcii za X i Y
 *
 * vtori klas Okrujnost
 * danni coordinati na Centura na okrujnostta (taq danna shte e obekt ot tochka)
 * i Radius
 * konstruktor bez parametri
 * get funkciq za dostu do radiusa
 * funkciq za vizualizaciq dannite za okrujnostta
 *
 * glavna funkciq, pravim MASIV ot obekti ot klas okujnost(pone 3 elementa)
 * izvejdade dannite za onaq okrujnost s nai-golqm radius
 *
 * */
#include <iostream>

using namespace std;

//Базов клас за различни превозни средства
class point {
    int corX;
    int corY;
public:
    point() {
        cin >> corX;
        cin >> corY;
    }
    int getCorX() const {
        return corX;
    }
    int getCorY() const {
        return corY;
    }
};
class circle {
    int rad;
    point tochkaObject;
public:
    circle():tochkaObject() {
        cin>>rad;
    }
    int getRadius() const {
        return rad;
    }
    void showCircle() {
        cout << "X:" << tochkaObject.getCorX() << endl;
        cout << "Y:" << tochkaObject.getCorY() << endl;
        cout << "Radius:" << rad << endl;
    }
};
int main() {

    circle arr[5];
    int maxRadius = 0;
    int index = 0;

    for (int i = 0; i < 5; ++i) {
        if (arr[i].getRadius() > maxRadius){
            maxRadius = arr[i].getRadius();
            index = i;
        }
    }
    arr[index].showCircle();


}
/* glavna funkciq, pravim MASIV ot obekti ot klas okujnost(pone 3 elementa)
   izvejdade dannite za onaq okrujnost s nai-golqm radius */