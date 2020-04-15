
public class ThreadsExample {

	public static int currentPoolCapacity;
	public static int maxPoolCapacity;
	public static Object poolMutex;
	
	public static void main(String[] args) {
		poolMutex = new Object();
		maxPoolCapacity = 5000;
		int timeRunning = 0;
		PoolThread t1, t2, t3;
		t1 = new PoolThread(10, 30, poolMutex);
		t2 = new PoolThread(-50, 70, poolMutex);
		t3 = new PoolThread(-300, 1000, poolMutex);
		t1.start();
		t2.start();
		t3.start();
		while(true)
        {
            synchronized (poolMutex) {
		
                System.out.println("Time: "+timeRunning+" -> Pool Capacity: "+currentPoolCapacity);
            }

            timeRunning++;
            try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				System.out.println("Thread was interrupted!");
			}

        }
/// Ако няма безкраен цикъл трябва да се сложат изчаквания за отделните нишки		
//       t1.join();
//       t2.join();
//       t3.join();

		
	}

}
