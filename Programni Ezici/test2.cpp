#include <iostream>
#include <string>

using namespace std;

class date {
    int day, mount, year;
public:
    date(int d, int m, int y) {
        day = d;
        mount = m;
        year = y;
    }
    int getDay() const {
        return day;
    }

    int getMount() const {
        return mount;
    }

    int getYear() const {
        return year;
    }
    friend ostream & operator << (ostream &obj1, date &obj2)
    {
        cout << "\n";
        cout << "day = ";
        obj1 << obj2.year() << "\n";
        cout << "mount = ";
        obj1 << obj2.getMount() << "\n";
        cout << "year = ";
        obj1 << obj2.getYear() << "\n";
        return obj1;
    }
};



int main() {
    date d1(2,3,4);
    cout<<d1;

    return 0;
}