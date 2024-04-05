import os 

from locust import HttpUser, task

class HelloWorldUser(HttpUser):

    @task
    def hello_world(self):
        self.client.get("/")

    def on_start(self):
        response = self.client.get('/accounts/login/?next=/')
        csrftoken = response.cookies['csrftoken']
        self.client.post('/accounts/login/?next=/',
            {
            'username': os.environ.get('LOCUST_USER', 'locust'),
            'password': os.environ.get('LOCUST_PASSWORD', 'locust')
            },
            headers={'X-CSRFToken': csrftoken})
