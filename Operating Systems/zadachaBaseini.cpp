#include <iostream>
#include <thread>
#include <mutex>
#include <chrono>
using namespace std;
mutex mutexPool;
int currentPoolCapacity = 600;

void poolFunction(int waterIncreasing, int sleepSeconds) {

    bool goSleep = false;

    while (true) {
        mutexPool.lock();

        if (currentPoolCapacity + waterIncreasing <= 600) {
            goSleep = true;
        } else {
            currentPoolCapacity += waterIncreasing;
        }

        if (currentPoolCapacity > 700) {
            goSleep = true;
        }

        mutexPool.unlock();

        if (goSleep)
        {
            this_thread::sleep_for(chrono::seconds(sleepSeconds));
            goSleep = false;
        }
    }
}

int main()
{
    thread * t1, * t2, * t3;
    t1 = new thread(poolFunction, 100, 2);
    t2 = new thread(poolFunction, 80, 2);
    t3 = new thread(poolFunction, -110, 1);
    int timeRunning = 0;
    
    while (true)
    {
        mutexPool.lock();
        printf("Time: %d -> Pool Capacity: %d\n", timeRunning,currentPoolCapacity);
        mutexPool.unlock();
        timeRunning++;
        this_thread::sleep_for(chrono::seconds(1));
    }
    t1->join();
    t2->join();
    t3->join();

}