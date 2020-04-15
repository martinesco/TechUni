using System;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace Threads
{
    
    class Program
    {
        static public int currentPoolCapacity;
        static public Mutex poolMutex;
        static public int maxPoolCapacity = 5000;
        static void threadFunction(int updateVolume, int sleepTimeMilliseconds)
        {
            bool sleepFlag = false;
            while (true)
            {
                if(poolMutex.WaitOne())
                {
                    if ((currentPoolCapacity + updateVolume > maxPoolCapacity)
                    || (currentPoolCapacity + updateVolume < 0))
                        sleepFlag = true;
                    else
                        currentPoolCapacity += updateVolume;
                    poolMutex.ReleaseMutex();
                }

                if (sleepFlag)
                {
                    Thread.Sleep(10000); //10sec.
                    sleepFlag = false;
                }
                else
                {
                    Thread.Sleep(sleepTimeMilliseconds);
                }
            }
        }
        static void Main(string[] args)
        {
            currentPoolCapacity = 0;
            poolMutex = new Mutex();
            int timeRunning = 0;

            Thread t1, t2, t3;
            t1 = new Thread(() => threadFunction(10,30));
            t2 = new Thread(() => threadFunction(-50,70));
            t3 = new Thread(() => threadFunction(-300,1000));

            t1.Start();
            t2.Start();
            t3.Start();
            while(true)
            {
                if (poolMutex.WaitOne())
                {
                    Console.WriteLine("Time: {0} -> Pool Capacity: {1}", timeRunning, currentPoolCapacity);
                    poolMutex.ReleaseMutex();
                }

                timeRunning++;
                Thread.Sleep(1000);

            }
            t1.Join();
            t2.Join();
            t3.Join();
        }
    }
}
