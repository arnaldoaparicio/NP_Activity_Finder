## Setup
1. Clone this repository:
On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the repositiory.

- using https <br>
```shell
$ git clone https://github.com/WadeNaughton/NP_Activity_Finder.git
```
- using SSH <br>
```shell
$ git clone git@github.com:WadeNaughton/NP_Activity_Finder.git
```

2. Change to the project directory:<br>

``` 
cd NP_Activity_Finder
```

3. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

4. Database Migration<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db:{:drop, :create, :migrate}
```

5. Set up environment variables

```shell
$ bundle exec figaro install
```


6. Visit https://www.nps.gov/subjects/developer/get-started.htm to sign up for an API key <br>

7. Add the following code to your application.yml file

```shell
parks_key: api_key_goes_here
```

8. Startup and Access<br>
Finally, in order to use the web app you will have to start the server locally and access the app through a web browser. 
- Start server
```shell
$ rails s
```

- Open web browser and visit link
    http://localhost:3000/
    
At this point you should be taken to the welcome page of the web-app. If you encounter any errors or have not reached the web-app please confirm you followed the steps above and that your environment is properly set up.
