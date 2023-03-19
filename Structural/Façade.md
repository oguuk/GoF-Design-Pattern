# Façade
    Façade 패턴은 클라이언트 코드가 시스템 내부의 구현 상세를 알 필요 없이 간단하게 시스템과 상호작용할 수 있도록 해주는 패턴이다.

## Example
```swift
import UIKit

struct Downloader {
    
    func fetch(url: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else { return }
        let configure = URLSessionConfiguration.default
        let session = URLSession(configuration: configure)
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error != nil { return }
            completion(data)
        }
        dataTask.resume()
    }
    
}
```

## Usage
```swift
    private var facade: Downloader = Downloader()
    
    facade.fetch(url: urlTextField.text ?? "") { data in
        var image = UIImage(systemName: "photo.fill")
        if let data = data, let imageData = UIImage(data: data) {
            print("image setting complete")
            image = imageData
        }
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
```
