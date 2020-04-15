#include<iostream>
#include <tchar.h>

using namespace std;
class Circle {
    int x, y, r;
public:
//Конструктор без параметри
    Circle();
//Конструктор с параметри
    Circle(int, int, int);
//Копиращ конструктор
    Circle(Circle &);

    int getx();
    int gety();
    int getr();
    void show();
    friend ostream & operator << (ostream & obj1, Circle &obj2);
};
Circle::Circle()
{
    cout << "x = ";
    cin >> x;
    cout << "y = ";
    cin >> y;
    cout << "r = ";
    cin >> r;
}
Circle::Circle(int a, int b, int c)
{
    x = a;
    y = b;
    r = c;
}
Circle::Circle(Circle &obj)
{
    x = obj.getx() + 1;
    y = obj.gety() + 2;
    r = obj.getr() + 3;
}
int Circle::getx()
{
    return x;
}
int Circle::gety()
{
    return y;
}
int Circle::getr()
{
    return r;
}
void Circle::show()
{
    cout << "\n";
    cout << "x = " << x;
    cout << "\n";
    cout << "y = " << y;
    cout << "\n";
    cout << "r = " << r;
    cout << "\n";
}
//Предефиниране на <<
ostream & operator << (ostream &obj1, Circle &obj2)
{
    cout << "\n";
    cout << "x = ";
    obj1 << obj2.getx() << "\n";
    cout << "y = ";
    obj1 << obj2.gety() << "\n";
    cout << "r = ";
    obj1 << obj2.getr() << "\n";
    return obj1;
}
int _tmain(int argc, _TCHAR* argv[])
{
    Circle c1;
    c1.show();
//Активиране на копиращ конструктор
    Circle c2 = c1;
    cout << c2;

    Circle c3(10,20,30);
    cout << c3;
//Дефиниране на динамичен обект, извикване на конструктор без параметри
    Circle *p1 = new Circle;
    cout << *p1;
//Дефиниране на динамичен обект, извикване на конструктор с параметри
    Circle *p2 = new Circle(10,20,15);
    cout << *p2;
    return 0;
}

