## sql2json-rest-api
The app which installs a /sql web app which accepts SQL query with POST request and returns the result in JSON.
## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation with ZPM

zpm:USER>install sql-rest

## Installation for development

Create your repository from template.

Clone/git pull the repo into any local directory e.g. like it is shown below (here I show all the examples related to this repository, but I assume you have your own derived from the template):

```
$ git clone git@github.com:evsharov/sql2json-rest-api.git
```

Open the terminal in this directory and run:

```
$ docker-compose up -d --build
```

or open the folder in VSCode and do the following:
![rest](https://user-images.githubusercontent.com/2781759/78183327-63569800-7470-11ea-8561-c3b547ce9001.gif)


## How to Work With it

This template creates /sql REST web-application on IRIS which accepts POST requests with SQL and returns results in JSON

Open http://localhost:52775/swagger-ui/index.html?url=http://localhost:52775/api/mgmnt/v1/USER/spec/sql to test the REST API


You can query any table in IRIS in the namespace.

e.g. you can test with Titanic data, which you have if you start docker.
if you installed with ZPM in a clear namespace you can import titanic data as:

USER>zpm "install csvgen"
USER>d ##class(community.csvgen).GenerateFromURL("https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv",",","Data.Titanic")

And run query POST request as:
<img width="1411" alt="Screenshot 2020-12-12 at 23 52 40" src="https://user-images.githubusercontent.com/2781759/101994683-3502ab00-3cd5-11eb-869d-e6d5dd5e68d6.png">

and have the result as:
<img width="1095" alt="Screenshot 2020-12-12 at 23 54 36" src="https://user-images.githubusercontent.com/2781759/101994708-667b7680-3cd5-11eb-9d74-84639c163df4.png">



