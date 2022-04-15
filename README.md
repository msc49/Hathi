# Real Time Chat-Room App

Hathi is a real time Chatroom messenger in which users can create Chatrooms and communicate with one another. It is created using Rails and utlises Hotwire for partial page updates over the web socket. 

## Features

- Real time User creation
- Real time Chatroom Creation
- Real time Messaging (including images/videos/pdfs)

## Prerequisites

- Ensure PostgreSQL is installed on your machine

```
bundle install
```
```
npm install
```
- Please make sure you have postgres database called 'postgres' as specified in the config/database.yml file or you can just configure it to what the database is called in your machine. You may also need to add a username and password in the database.yml file if that is required for you local machines postgres database
- Please make sure you migrate the databases

```
rails db:migrate
```

## Running the server

in the terminal, do not use rails server but instead type the following and enter:

```
bin/dev

```

Now open up your browser (I suggest using Chrome or Safari because Firefox can be a hit or miss) and go to localhost:3000 then sign up and head to the Chatrooms.

## Feature Previews

1. Real Time ChatRoom Creation

[!Chat Room Creation](./app/assets/gifs/real_time_chatroom_creation.gif)



2. Real Time Messaging 

[!Real Time Messaging](./app/assets/gifs/real_time_messaging.gif)


3. Real Time User Creation

[! User Creation  ](./app/assets/gifs/real_time_user_creation.gif)

