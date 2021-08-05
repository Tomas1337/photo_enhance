from celery import Celery

rabbit_path = 'amqp://admin:mypass@rabbit:5672'
redis_path = 'redis://redis:6379/0'

cellapp = Celery('celery_tasks', 
    backend=redis_path, 
    broker=rabbit_path,
    include = ['GFPGAN.tasks']
)
 # Results take a lotttt of time in the first run due to initialization. Subsequent requests should be dramatically faster
 # result_expires is set very high due to this reason
 # TODO: decrease result_expires after a number of requests have already been fulfilled that ensures the system is primed already 
cellapp.conf.update(
    result_expires=100000,
)

if __name__ == "__main__":
    cellapp.start()