# Tape-selecta
## What is tape-selecta?
Tape-selecta is a dockerized icecast2 server together with ezstream and node.js makes the perfect way to set up your own **online radio station** following just a few simple steps.

## How does it work?
The setup is very simple:
1. Install [Docker](https://www.docker.com/).
2. Cope your mp3 files into the _music_ directory.
3. Run _start.sh_.
4. Check **localhost:8000/mountpoint**, your music should be streaming there!

## Configuration
Before running your online radio station, it is important to make some security changes to the configuration of the [Icecast2](https://icecast.org/) server. Change the content of the file **icecast-config/icecast.xml**:

```
<authentication>
    <!-- Sources log in with username 'source' -->
    <source-password>password</source-password>
    <!-- Relays log in with username 'relay' -->
    <relay-password>password</relay-password>

    <!-- Admin logs in with the username given below -->
    <admin-user>admin</admin-user>
    <admin-password>password</admin-password>
  </authentication>
```

After this change the content of the **ezstream-config/ezstream_mp3.xml** file to match the password choosen for the Icecast2 admin user.

```
<sourcepassword>password</sourcepassword>
```

There are some other configuration options in both xml files please check the [Icecast documentation page](https://www.icecast.org/docs/) and [Ezstream documentation page](https://icecast.org/ezstream/) to know more on the subject.

## Front end
The code of the project includes an [Express](https://expressjs.com/)/[Node.js](https://nodejs.org/en/) server, ready to the static files included in the **web/public** directory.
Futhermore, it is possible to retrieve the information of the current track playing in the endpoint **localhost/status**, the information can be useful in case we want to show information of the track provided by the mp3 tags of the file. 
