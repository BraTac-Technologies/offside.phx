<h1 align='center'> Offside.phx </h1>

```
 $$$$$$\   $$$$$$\   $$$$$$\            $$\       $$\            $$$$$$\  $$\   $$\                           $$\     
$$  __$$\ $$  __$$\ $$  __$$\           \__|      $$ |          $$  __$$\ $$ |  $$ |                          $$ |    
$$ /  $$ |$$ /  \__|$$ /  \__| $$$$$$$\ $$\  $$$$$$$ | $$$$$$\  \__/  $$ |$$ |  $$ |    $$$$$$$\   $$$$$$\  $$$$$$\   
$$ |  $$ |$$$$\     $$$$\     $$  _____|$$ |$$  __$$ |$$  __$$\  $$$$$$  |$$$$$$$$ |    $$  __$$\ $$  __$$\ \_$$  _|  
$$ |  $$ |$$  _|    $$  _|    \$$$$$$\  $$ |$$ /  $$ |$$$$$$$$ |$$  ____/ \_____$$ |    $$ |  $$ |$$$$$$$$ |  $$ |    
$$ |  $$ |$$ |      $$ |       \____$$\ $$ |$$ |  $$ |$$   ____|$$ |            $$ |    $$ |  $$ |$$   ____|  $$ |$$\ 
 $$$$$$  |$$ |      $$ |      $$$$$$$  |$$ |\$$$$$$$ |\$$$$$$$\ $$$$$$$$\       $$ |$$\ $$ |  $$ |\$$$$$$$\   \$$$$  |
 \______/ \__|      \__|      \_______/ \__| \_______| \_______|\________|      \__|\__|\__|  \__| \_______|   \____/
 ```
                                                                                                
                                                                                                
 ## Overview                                                                                               
 Offside.phx is a full stack application having a goal to promote the world table tennis to the bulgarian press

## Used Technology
+ Elixir: 1.13.2
+ Phoenix: 1.6.5
+ PostgreSQL: v.14
+ Tailwind: v.3

## Start application
The app is currently deployed on `Offside24.net` domain. However, if you want to power-up in dev mode follow these steps:
+ Clone the repo from git
```
git clone https://github.com/BraTac-Technologies/offside.phx.git
```
+ Install dependencies with:
```
cd offside.phx
mix deps.get
```
+ DB create and run migrations
```
mix ecto.create
mix ecto.migrate
```
+ Install requirement assets
```
cd assets
npm install
```
+ Start the server and visit `localhost:4000`
``` 
cd ..
mix phx.server
```



