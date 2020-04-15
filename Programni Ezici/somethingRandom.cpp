

#include <iostream>

using namespace std;

class ElUred {
private:
    int price;
    int power;
public:
    ElUred(int p, int cP);

    ElUred() {};

    ~ElUred() { cout << "Destroying object"; }

    int getPower();

    int getPrice();

    virtual void getInfo() = 0;
};

ElUred::ElUred(int p, int cP) {
    this->price = p;
    this->power = cP;
}

int ElUred::getPower() {
    return power;
}

int ElUred::getPrice() {
    return price;
}

class Cooker : virtual public ElUred {

private:
    int broi;
public:
    Cooker(int b, int p, int cP);

    Cooker() : ElUred() {}

    int getBroi();

    void setBroi(int p);

    void getInfo();
};

Cooker::Cooker(int b, int p, int cP) : ElUred(p, cP) {
    broi = b;
}

void Cooker::setBroi(int p) {
    this->broi = p;
}

int Cooker::getBroi() {
    return broi;
}

void Cooker::getInfo() {
    cout << "Broi: " << getBroi() << endl;
    cout << "Price: " << getPrice() << endl;
    cout << "Power: " << getPower() << endl;
}

int main() {

    Cooker *elUred = new Cooker[2];
    Cooker c1(6, 520, 700);
    Cooker c2(2, 530, 700);
    elUred[0] = c1;
    elUred[1] = c2;
    for (int i = 0; i < 2; i++) {

        if (elUred[i].getPrice() > 500) {
            elUred[i].getInfo();
        }
    }
    cout << "Hello world!" << endl;
    return 0;
}

