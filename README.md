![Logo](https://github.com/Moaht/sustainability_website/assets/117759431/eb393b62-5400-4e60-ad63-6056125b112e)

Website for promoting and gameifying sustainability on University campus

## Setting up

Open your shell and clone into whichever directory you'd like to store the website in.
After cloning, change directory into the generated ```sustainability_website``` directory i.e:
```
cd ./sustainability_website 
```

Your current directory should look something like this:
```
.
├── api
├── db.sqlite3
├── documentation
├── frontend
├── LICENSE
├── manage.py
├── README.md
└── sustainability_website
```

First we set up a virtual environment for the modules that will be used for the project:
``` 
python3 -m venv venv
```

Then we activate the virtual environment:

 - For _Linux_ and _Mac_ run:
``` source ./venv/bin/activate ```

- And on _Windows_ its: 
```.\venv\Scripts\activate```

Then we upgrade pip and install a few modules:
```
python -m pip install --upgrade pip django djangorestframework
python -m pip install Pillow 
```
> [!IMPORTANT]
> Before you move on to the next step, make sure your node and npm are updated to the latest version.

Next we set up node:
```
cd frontend/ 
npm i
npm run dev
```

Then we set up the database :
```
cd ..
python manage.py migrate 
```

And that's it!

You can run the server now by running :
```python manage.py runserver``` 

The links for the user, game keeper and admin are:
```
http://127.0.0.1:8000/
http://127.0.0.1:8000/staff
http://127.0.0.1:8000/admin
```
We have populated database with the file data.sql, feel free to use it


To access the gamekeeper page, cd into gamekeeper run
```npm i```
then
```npm run dev```
to access it, go to site ```http://127.0.0.1:8000/staff```


>[!TIP]
>You may wish to set up an webmaster admin (superuser) account. 
>To do so, you will need to do:
>```python manage.py createsuperuser``` 
>And follow the instructions provided.

