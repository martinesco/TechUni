/*da se predefinirat operaciite za + i - na vektor sus chislo kato se
suzdade klas v koito ima 2 chen danni, razmer na masiva i ukazatel
i 5 chen funkcii. Konstruktor bez parametri za inicializaciq na masiva chrez klaviaturata
        destruktor za osvobojdavane na zadelenata ot konstruktora pamet
2 operatorni funkcii za dvete operacii (+ i -)
i 5-tata funkciq e za vizualizirane i izvejdane sudirjanieto na masiva

da se suzdade obekt ot klasa Vektor i da se demonstrira deistvieto na
*/
#include <iostream>
using namespace std;
class vector {
    int arrSize;
    int *arr;

public:
    vector() {
        cin >> arrSize;
        arr = new int[arrSize];

        for (int i = 0; i < arrSize; ++i) {
            cin >> arr[i];
        }
    }
    ~vector() {
        //free(arr);
        delete[]arr;
    }

    vector operator+= (int i){

    }
};



int main() {


    return 0;
}