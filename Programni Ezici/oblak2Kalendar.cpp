/*
Дефинирайте клас, описващ дати от календара.
Дефинирайте копиращ конструктор и такъв с параметри за задаване на дата.
Клас описващ студент - Име, Факултетен номер, Дата на раждане и Среден успех.
Метод, който сравнява за по-малко по даден параметър обект с текущия.
Демонстрирайте работата на класовете със създаване на колекция от студенти
и сортирайте студентите по успех в низходящ ред
*/
#include <iostream>

using namespace std;

class Date {
    int day, mount, year;

public:
    Date(int d, int m, int y) {
        day = d;
        mount = m;
        year = y;
    }

    Date(Date &obj){
        day = obj.getDay();
        mount = obj.getMount();
        year = obj.getYear();
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
};

class Student {
    string name;
    int fakNumber;
    //ne pishem data tuk
    double srUspeh;
public:
    Date *DateOfBirth;

 Student(){
        cout<<"Enter name:";
        cin>>name;

        cout<<"Enter facNumber";
        cin>>fakNumber;

        cout<<"Enter srUspeh";
        cin>>srUspeh;

        //fflush(stdin);
    }
    void show(){
        cout<<"Name: "<<name<<" facNumer: "<<fakNumber<<"Date of birth: "<<
        DateOfBirth->getDay()<<"."<<
        DateOfBirth->getMount()<<"."<<
        DateOfBirth->getYear()<<
        " srUspeh "<<srUspeh<<endl;
    }
};

int main(){

   Student students[3];
   int index = 0;

   Date d1 (1,1,1000);
   Date d2 (2,2,2000);
   Date d3 (3,3,3000);

   students[0].DateOfBirth = new Date(d1);
   students[1].DateOfBirth = new Date(d2);
   students[2].DateOfBirth = new Date(d3);

   for(index = 0; index<3;index++){
       students[index].show();
   }
    return 0;

}
/* Клас описващ студент - Име, Факултетен номер, Дата на раждане и Среден успех.
Метод, който сравнява за по-малко по даден параметър обект с текущия.
Демонстрирайте работата на класовете със създаване на колекция от студенти
и сортирайте студентите по успех в низходящ ред*/