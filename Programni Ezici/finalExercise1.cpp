/* da se definira clas data
s den, mesec, godina i clen funkcii
construktor bez parametri i 3 get funkcii
        2ri klas Lice
        s Ime, suma na vloga, godishna lihva, data na vnasqne na prite v bankata,
 construktor bez parametri
 f() za izvejdane na dannite na liceto
 f() za izchislenie na poluchenata lihva

 v glavnata funkciq da se napravi masiv ot obekti ot klas Lice
 i da se izvede liceto s nai-golqma godishna lihva
 */

#include<iostream>

using namespace std;

class data {
    int day, mount, year;
public:
    data() {
        cout << "enter date, mount and year\n";
        cin >> day >> mount >> year;
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
class person {
    string name;
    double sumOfDeposit;
    double percentInterest; //lihva
    data dateOfDeposit;
public:
    person() : dateOfDeposit() {
        cout << "enter person's name, sum of vlog,  % lihva\n";
        cin >> name;
        cin >> sumOfDeposit;
        cin >> percentInterest;
    }

    void show() {
        cout << name << " " << sumOfDeposit << " " << percentInterest << endl;
        cout << "data: " << dateOfDeposit.getDay();
        cout << " " << dateOfDeposit.getMount();
        cout << " " << dateOfDeposit.getYear();
    }

    void calculateSomething() { //smetame nekvi neshta ne e bash lihva
        int currentYear = 2019;
        int yearsPrestoi = 2019 - dateOfDeposit.getYear();
        sumOfDeposit += percentInterest * yearsPrestoi;
    }

    double getSumOfDeposit() const {
        return sumOfDeposit;
    }
};
/*v glavnata funkciq da se napravi masiv ot obekti ot klas  Lice
 i da se izvede liceto s nai-golqma godishna lihva
 */
int main() {

    person personArr[3];
    double maxYearInterest = 0;
    int index = 0;

    for (int i = 0; i < 3; i++) {

        personArr[i].calculateSomething();

        if (personArr[i].getSumOfDeposit() > maxYearInterest) {
            maxYearInterest = personArr[i].getSumOfDeposit();
            index = i;
        }
    }

    personArr[index].show();

}


