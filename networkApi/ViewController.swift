import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let apiRequest = APIRequest()
    var posts: [PostStruct]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Posts"
        collectionView.delegate = self
        collectionView.dataSource = self

        // NIB dosyasını register et
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        loadData()
    }
    
    func loadData() {
         apiRequest.fetchPosts { [weak self] posts in
             guard let self = self else { return }
             
             if let posts = posts {
                 DispatchQueue.main.async {
                     self.posts = posts
                     self.collectionView.reloadData()
                     print(posts)
                 }
             } else {
                 print("data yoxdu")
             }
         }
     }

    // Verilerin sayısı
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }

    // Her hücrenin içeriğini oluşturma
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        guard let post = posts?[indexPath.row] else {
            return cell
        }
        cell.configure(with: post)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let padding: CGFloat = 10  // Kenar boşlukları
        let collectionViewSize = collectionView.frame.width - padding

        let cellWidth = collectionViewSize / 2  // Her satırda iki hücre
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
