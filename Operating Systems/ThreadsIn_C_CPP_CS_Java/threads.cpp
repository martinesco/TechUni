#include <iostream>
#include <thread>
#include <mutex>
#include <chrono>
using namespace std;
mutex mutexPool;
int currentPoolCapacity = 0;
int maxPoolCapacity = 5000;

void threadFunction(int updateVolume, int sleepInMilliseconds)
{
	
	bool sleepFlag = false;
	while (true)
	{
		mutexPool.lock();
		if ((currentPoolCapacity + updateVolume > maxPoolCapacity)
			|| (currentPoolCapacity + updateVolume < 0))
			sleepFlag = true;
		else
			currentPoolCapacity += updateVolume;
		mutexPool.unlock();

		if (sleepFlag)
		{
			this_thread::sleep_for(chrono::seconds(10));
			sleepFlag = false;
		}
		else
		{
			this_thread::sleep_for(chrono::milliseconds(sleepInMilliseconds));
		}
	}

}
int main()
{
	int timeRunning = 0;
	thread *t1, *t2, *t3;
	t1 = new thread(threadFunction, 10, 30);
	t2 = new thread(threadFunction,-50, 70);
	t3 = new thread(threadFunction, -300, 1000);
	while (true)
	{
		mutexPool.lock();
		printf("Time: %d -> Pool Capacity: %d\n", timeRunning, currentPoolCapacity);
		mutexPool.unlock();
		timeRunning++;
		this_thread::sleep_for(chrono::seconds(1));
	}
	t1->join();
	t2->join();
	t3->join();

}