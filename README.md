# MR-Softwares-Task

# In this project I create a CICD pipeline using only bash script. This CICD pipeline includes tasks like

• Triggering the pipeline whenever there is a new change or commit to a specific directory.

• Run a series of tests on the repo and make sure it is in good condition or in a deployable state

• If the test fails it runs automatic diagnostics and fixes common issues (for e.g:- clearing the cache from the code ).

• If the test passes then it build a Docker image using the Docker file and then creates the container from that image and then deploys the project on it

• In scenarios such as the container is already available and the project is already deployed on the container, it simply updates the changes made in our project repo to the volume mapped with the container... without disturbing it.

# Here's what those scripts do :-

•  trigger.sh :– is the first script of the CICD pipeline whose function is to scan if there are changes in the specified directory using its latest and last commit ID. It fetches the latest commit ID of the repo and matches it with its last commit ID that is present inside txt file in the directory . If it is different it triggers the next script in the pipeline which is test.sh and update the txt file with latest commit ID. 

•  test.sh :- checks if there is a virtual environment, if not it creates the virtual environment and installs all the dependencies and runs the test if the test fails it triggers diagnosis.sh and if If the test passes it triggers contcheck.sh.

•  diagnosis.sh :- tries to diagnose the problem and fix common problems (in my case it clears the cache files) and then retriggers test.sh to test again.

• contcheck.sh :- basically checks the container whether it is already there or not and if it is there then it triggers copy.sh and if not then it triggers deploy.sh.

• copy.sh :-  copies the content from the project repo to the volume directory (if it's not exist it creates one) which is shared with the container.

• deploy.sh :- First it triggers Copy.sh, then it checks if docker is installed or not, if not then it will install it, then start its service, then checks the docker file, If it's not available, it creates the dockerfile, after that builds an image using it. Then creates the container and mapping it to the shared volume that contains the project and defines the port.
