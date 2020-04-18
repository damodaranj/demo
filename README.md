# devops-assessment

This repository contains a NodeJS application with two endpoints.

`/hive`, that will always return:

```
{
    foo: "bar"
}
```

`/healthcheck`, that will return either:

```
{
    status: "up",
    uptime: 2000
}
```

```
{
    status: "down",
    reason: "Why are we down"
}
```

## Environment Variables
There is a single environment variable `PORT` - on which the node application will listen.  If running the application outside of Docker, then a `.env` file will be loaded in which the port can be specified.

## Running outside Docker

If you have node installed on your local machine, then the following commands can be used:

* `npm install` - Install dependencies
* `npm run test` - Run unit tests
* `npm run watch` - Start in watch mode

## Running inside Docker
The included Dockerfile can be used to build a container image. Currently the Dockerfile will copy across all source files, install depencies and run tests.

```
docker build --tag devops:latest .
```

When the image is built, it can be started using:

```
docker run -d -p 3000:3000 devops:latest
```

The application should now be available on `localhost:3000`



```Beanstalk Application```

Requirments

1. aws access key
2. secret key

Note: 
    Privileges of s3 ec2 loadbalancer autoscalling beanstalk

3. github
4. travisCI (integrated with same github)
5. just upload the same into github
6. will travisCI deploy on the same into aws