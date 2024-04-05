# My CIS-92 Project 

This repository has the starter code for CIS-92. 

By: Richard Gross

# The variables from config.yaml

| Variable Name | Default Value | Description |
| --- | --- | --- | 
|  PORT | 8000 | Port used | 
| STUDENT_NAME | Richard Gross | Username | 
| SITE_NAME | www.ultimatefrisbee.com | Sitename | 
| DATA_DIR | /data | Data directory | 
| Debug | "1" | Debug is true | 

# The variables from secret.yaml

| Variable Name | Default Value | Description |
| --- | --- | --- |  
| metadata | mysite-secret | The metadata from secret.yaml |  
| SECRET_KEY | "PUTYOUROWNHERE" | The secret key |

# To create a new SECRET_KEY
echo -n 'How much wood could a wood chuck chuck if a wood chuck could chuck wood?' | base64 <br>
Put that in your SECRET_KEY variable in secret.yaml
before next command below.

# Start up command
kubectl apply -f deployment/

# Initilize Database
kubectl exec --stdin --tty pod/mysite-pod -- /bin/bash

python manage.py migrate

python manage.py createsuperuser

# Delete the Kubernetes pod
kubectl delete -f deployment/
