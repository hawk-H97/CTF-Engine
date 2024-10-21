# CTF-Engine
CTF Platform:

We created the customise ubuntu os in the Dockerfile.

What kind of customise are?

    1. We create a username and password.
    2. Add open SSH server with private and public key.
    3. User we give access sudo permission.
    4. And set open port 22 for SSH.
 
 So participants wants to access CTF chanllenge which have backgroung running docker container. We want set 50 to 100 containers, Each participants have separate containers for separate workspace. Without distrub the other containers, we built separate workspace.

how we separate means we give each container with unique port number. eg ssh ctfuser@(ip) -p (port number)
