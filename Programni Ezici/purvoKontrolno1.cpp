/* definiraite klas opisvasht dati ot kalendara
definiraite konstruktor s parametri za zadavane na data i kopirasht konstruktor.
 da se definira klas poseshteniq na pacienti pri lichen doktor s danni :
 egn, imeNaPacienta, oplakvaniq,dataNaPregleda,(polzva se klasa data), predpisani lekarstva do 5broia.
 Predefiniraite na operaciqta << za izvejdane na dannite. Da se sustavi glavna f() koqt suzdava
 masiv ot obekti ot klas poseshteniq na pacienti i izvedete all pacienti sus zadadeno oplakvane */

#include <iostream>

using namespace std;

class data {
    int day, mount, year;
public:
    data(int d, int m, int y) {
        day = d;
        mount = m;
        year = y;
    }

    data(data &obj) {

    }
};

class visitations {
    int egn;
    string pacientName;
    string oplakvaniq;
    data dataNaPregled;
    int broiLekarstva;
public:
    visitations(int egn, const string &pacientName, const string &oplakvaniq, const data &dataNaPregled,
                int broiLekarstva) :
                egn(egn),
                pacientName(pacientName),
                oplakvaniq(oplakvaniq),
                                     broiLekarstva(broiLekarstva) {}

private:

    friend ostream &operator<<(ostream &obj1, visitations &obj2);
};


