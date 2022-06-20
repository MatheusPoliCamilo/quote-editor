# **README**

This project is a modern, single-page, reactive web applications with Ruby on Rails 7 without writing any custom JavaScript code. Built in the turbo rails tutorial: [Hotrails](https://www.hotrails.dev/).

## **Setting up the project**

First of all, you need to install the **Ruby 3.0.X** version. You can use the [**rvm**](https://rvm.io/) or [**asdf**](https://asdf-vm.com/) for this.

Since we use a **PostgreSQL database**, you also need to install the **PostgreSQL server** and start it:

```
sudo service postgresql start
```

With the **Ruby** installed, and the **PostgreSQL** service running, you need to install all the projects dependecies and setup the database:
```
bin/setup
```

### **Starting Redis server**

Start you Redis server with the command below to make **Action Cable** work locally:

```
redis-server
```

### **Running migrations**

You need to modify your database schema according to the project schema:

```
bin/rails db:migrate
```

### **Populating the development database**

You can populate your development database with sample data:

```
bin/rails db:seed
```

## **Running the project**

To run the project in the http://localhost:3000, run the command below:
```
bin/dev
```
