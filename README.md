# Project Summary and Details

### Architecture

I used the Clean Code Architecture with Test Driven Development along with the feature first folder structure. The reason behind choosing is : 

* **Separation of Concerns**: Clean Architecture enforces a clear separation between the presentation layer (UI), business logic (domain layer), and data access layer. This promotes modularity, making the code easier to understand, maintain, and test.
* **Testability**: The isolation of layers allows for easier unit testing of the core business logic without dependencies on the UI or specific data sources.
* **Scalability**: This kind of architecture is very scalable, we can use local packages for those features that are required all over the the app when the project becomes huge. 
* **TeamWork**: This feature's first folder structure will make it easy to work with dynamic and scaleable teams easily. 


## UI Final Look

![simulator_screenshot_4FFE82EC-389E-485B-B262-215EB82D053C](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/714db887-6b8b-4b37-aa6b-d3e615eb56ae)
![simulator_screenshot_81EFFB9E-4323-4E12-ACD3-CDCD12934D69](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/6df973b4-5a58-4ba4-bd27-b7846cac0015)
![simulator_screenshot_54F53E3D-74B5-49BA-A398-D4A7BFFAB8F3](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/db11fed5-d732-4700-b96c-13c2d3cebcd0)
![simulator_screenshot_EA6AFE42-C6D4-4AA5-94CD-19180AA98768](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/5ace6b88-328f-4418-944d-1eb2b5983f0d)
![simulator_screenshot_4E8B1362-DCFD-498C-B8B2-D0DAC5ACA812](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/ba5cd4b1-b6da-4acf-9260-cb3057aa20b4)
![simulator_screenshot_56D2889D-69A2-44D5-9722-8AE55C4BAD43](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/5e3ce827-4d63-417d-8b86-a96c732b4850)
![simulator_screenshot_9E68B7BD-A11E-4ED8-8BB6-0CDEA8D3F916](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/1e398629-d5ea-4123-a63e-fa2a51f36c6c)
![simulator_screenshot_A7A59113-C66B-43D2-9BB9-0E99F4C74E45](https://github.com/rabindeveloper11/flutter-tdd/assets/72679799/bb268055-0d55-47ad-a482-88644794df0f) 

### To run the project 

Clone the project

```
git clone https://github.com/rabindeveloper11/flutter-tdd.git
```

Get all dependencies

```
flutter pub get
``` 

### Dependencies 

```
  dartz: ^0.10.1
  equatable: ^2.0.5
  flutter_bloc: ^8.1.4
  get_it: ^7.6.7
  http: ^1.2.1
  bloc_test: ^9.1.6
  flutter_screenutil: ^5.9.0
  svg_flutter: ^0.0.1
  flutter_svg: ^2.0.10+1
  cached_network_image: ^3.3.1
  path_provider: ^2.1.2
  hive: ^2.2.3
  hive_flutter: ^1.1.0
```

```dartz```: for functional programming
```equatable```: to compare the objects
```flutter_bloc```: state management solution
```get_it```: for dependency injection
```http```: for network requests
```bloc_test```: testing the blocs
```flutter_screentutil```: for responsiveness and adaptive design
```svg_flutter```: SVG rendering plugin
```cached_network_image```: to cache the image for faster loading
```path_provider```: to get the path of directory
```hive```: local database 
```hive_flutter```: local database


