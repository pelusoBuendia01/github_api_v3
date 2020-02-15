# github api v3
 git hub api swift package

### Description

Swift Package designed to generate GitHub API access as "Session" using token access


### Author Profile


|  |  | 
|----|---|
| name | peluso_buendia | 
| email | francisco.romero.valle.01@gmail.com | 


### Architecture


| Layer  | Description | 
|--------|-------------|
| [core](./Sources/github_api_v3/core/README.md) | Includes all the abstraction concepts for this api | 
| [data](./Sources/github_api_v3/core/README.md) | Includes all the data transmision features between this API pand Github server | 
| [API](./Sources/github_api_v3/core/README.md)  | Wrap the implemenytation and definition from "core" & "data" layers  | 

![Architecture layer dependency](./docs/img/architecture_layers.png "Architecture layer dependency")


### References
|Topic       |Link|
|:-----------|:-----------------------------------------------|
|Github API  |[https://developer.github.com/v3/](https://developer.github.com/v3/)|
|Architecture|[https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)


