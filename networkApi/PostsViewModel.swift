
import Foundation

class PostsViewModel {
    
    private let apiRequest = APIRequest()
    var posts: [PostStruct] = []
    
    var didUpdatePosts: (() -> Void)?
    
    func loadPosts() {
        apiRequest.fetch { [weak self] (posts: [PostStruct]?) in
            guard let self = self else { return }
            if let posts = posts {
                self.posts = posts
                self.didUpdatePosts?()
            }
        }
    }
}
