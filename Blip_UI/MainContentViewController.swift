import UIKit

class MainContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경색 설정
        view.backgroundColor = .white
        
        self.navigationItem.hidesBackButton = true
        
        // 상단 텍스트 추가
        let label = UILabel()
        label.text = "Blip Inside"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        view.addSubview(label)

        // 가로 스크롤 이미지 추가
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 500))
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = -50
        scrollView.addSubview(stackView)

        // 이미지 4개 추가
        for index in 1...4 {
            let imageView = UIImageView(image: UIImage(named: "man\(index)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
            stackView.addArrangedSubview(imageView)

            // Gesture Recognizer로 DetailView로 이동
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture)
            imageView.tag = index
        }
        
        stackView.frame = CGRect(x: 0, y: 0, width: CGFloat(300 * 4), height: 500)
        scrollView.contentSize = CGSize(width: CGFloat(300 * 4), height: 500)
    }

    // 이미지 클릭 시 DetailView로 이동
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            let detailVC = DetailViewController(person: mockData)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
