# Gloth

Build the images and run the containers:

```sh
docker-compose up -d --build
```

Test it out at [http://localhost:5000](http://localhost:5000). The "web" folder is mounted into the container and your code changes apply automatically.

To interact with the database shell:
```sh
docker exec -ti flask-on-docker_db_1 psql -U gloth postgres
```

or simply use a database tool to have a graphical interface to edit the db (dbeaver for example)
```python
POSTGRES = {
    'user': 'gloth',
    'pw': 'password',
    'db': 'postgres',
    'host': 'localhost',
    'port': '5432',
}
```

The only files you need to edit to modify the website are inside the `project` folder

Project Organization
------------

    ├── docker-compose.yml            <-- generates the containers
    ├── gloth
    │   ├── Dockerfile                <-- generates the containers
    │   ├── entrypoint.sh             <-- generates the containers
    │   ├── project
    │   │   ├── __init__.py           <-- makes src a Python module, init the website
    │   │   ├── config.py             <-- configuration file for the website
    │   │   ├── forms.py              <-- forms used by the site (text inputs, buttons etc.)
    │   │   ├── models.py             <-- classes that describe the database tables for the ORM
    │   │   ├── static                <-- css/jquery/ font files
    │   │   ├── templates             <-- html files used to display the pages
    │   │   │   ├── base.html         <-- top blue header
    │   │   │   ├── index.html        <-- index page
    │   │   │   └── medic.html        <-- page displayed after submit button
    │   │   ├── utils.py              <-- utility functions (queries etc.)
    │   │   └── views.py              <-- contains the views of the site (index, medic etc.)
    │   ├── requirements.txt          <-- python modules needed
    │   └── run.py                    <-- file that launches the site
    ├── gloth.sql                     <-- database dump
    └── README.md

--------

Please keep the same code structure (db models inside `models.py`, views inside `views.py`, forms inside `forms.py` etc.)