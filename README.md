# SideDish
[SideDish](https://github.com/1Consumption/sidedish-10)를 SwiftUI + Combine으로 구현한 프로젝트임.
## 데모

![Demo](https://github.com/1Consumption/SideDish/blob/main/demo.gif)



## 순서가 보장되는 비동기 방식

<img src = "https://user-images.githubusercontent.com/37682858/101021157-e35e7000-35b2-11eb-9efa-870d93f9e97a.gif" width = 600>

네트워킹하는 도중 서로 각기 다른 request인 main요리, soup요리, side요리의 순서가 보장되어야 하는 상황이 발생하였다. 네트워킹은 비동기로 동작하기 때문에 위와 같이 원하는 순서대로 오지 않을 가능성이 있다. 따라서 이를 해결하기 위해 두 가지 방법을 고안함. 결론적으로 한 번에 여러 개의 publisher가 값을 방출하는 `Zip`오퍼레이터를 사용해 이 문제를 해결함. 

### 1. flatMap

<img src = "https://user-images.githubusercontent.com/37682858/101024526-8ca76500-35b7-11eb-8eff-c334356bc7f3.gif" width = 600>

publisher sequnce를 만들고, flatMap 오퍼레이터를 사용함. 여기서 maxPublisher를 1로 설정해서 한 번에 하나의 퍼블리셔만 값을 방출할 수 있게 함. 그 결과 Pubisher A가 값을 방출하고, B가 값을 방출하고, C가 값을 방출하게 됨. 따라서 원하는 순서대로 작업을 실행할 수 있음. 그러나, 이 경우 serial하게 동작하기 때문에 concurrent하게 동작하는 방식보다 느림.

#### 소스코드

``` swift
func retrieveDish() {
    let main = dishPublisher(with: .main)
    let soup = dishPublisher(with: .soup)
    let side = dishPublisher(with: .side)
    
    [main, soup, side].publisher
        .flatMap(maxPublishers: .max(1)) { $0 }
        .sink { [weak self] result in
            switch result {
            case .failure(let error):
                self?.state = .failure(error)
            case .finished:
                self?.state = .done
            }
        } receiveValue: { [weak self] value in
            self?.sideDish.append(value)
        }
        .store(in: &bag)
}
```



### 2. Zip

<img src = "https://user-images.githubusercontent.com/37682858/101021171-e8232400-35b2-11eb-9cbf-3c8f69a68184.gif" width = 600>

여러 개의 publisher를 Zip 오퍼레이터로 묶어 concurrent하게 요청을 하면서 순서를 보장할 수 있음. Zip 오퍼레이터는 여러 upstream input을 하나의 튜플로 묶어주는 역할을 함. 이 경우 3개의 작업 중에서 가장 오래 걸리는 작업이 완료되는 시점에 값이 방출되기 때문에 serial하게 받는 방법보다 빠른 속도를 보장함.

#### 소스코드

```swift
func retrieveDish() {
    let main = dishPublisher(with: .main)
    let soup = dishPublisher(with: .soup)
    let side = dishPublisher(with: .side)
    
    Publishers.Zip3(main, soup, side)
        .sink { [weak self] result in
            switch result {
            case .failure(let error):
                self?.state = .failure(error)
            case .finished:
                self?.state = .done
            }
        } receiveValue: { [weak self] value in
            self?.sideDish.append(value.0)
            self?.sideDish.append(value.1)
            self?.sideDish.append(value.2)
        }
        .store(in: &bag)
}
```

## Reference

[WWDC19 Introducing Combine](https://developer.apple.com/videos/play/wwdc2019/722/)

[WWDC19 Combine in Practice](https://developer.apple.com/videos/play/wwdc2019/721/)

[GitHub CombineCommunity Pull Request](https://github.com/CombineCommunity/rxswift-to-combine-cheatsheet/pull/20)

