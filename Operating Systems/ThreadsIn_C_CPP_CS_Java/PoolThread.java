public class PoolThread extends Thread{
		private int updateVolume;
		private int sleepTimeInMilliseconds;
		private Object poolMutex;
		public PoolThread(int updateVolume, int sleepTimeInMilliseconds, Object poolMutex)
		{
			this.updateVolume = updateVolume;
			this.sleepTimeInMilliseconds = sleepTimeInMilliseconds;
			this.poolMutex = poolMutex;
		}
		@Override
		public void run()
		{
			boolean sleepFlag = false;
            while (true)
            {
                synchronized (poolMutex) {
					
				
                    if ((ThreadsExample.currentPoolCapacity + updateVolume > ThreadsExample.maxPoolCapacity)
                    || (ThreadsExample.currentPoolCapacity + updateVolume < 0))
                        sleepFlag = true;
                    else
                    	ThreadsExample.currentPoolCapacity += updateVolume;
                }
             try{
                if (sleepFlag)
                {
                    Thread.sleep(10000); //10sec.
                    sleepFlag = false;
                }
                else
                {
                    Thread.sleep(sleepTimeInMilliseconds);
                }
             }
             catch(InterruptedException e)
             {
            	 System.out.println("Thread was interrupted!");
             }
            }

		}
	}