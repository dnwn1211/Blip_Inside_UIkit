import UIKit

class MainContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경색을 ContentViewController와 동일하게 설정
        view.backgroundColor = .black
              
        self.navigationItem.hidesBackButton = true
        
        // 상단 이미지 추가 (logo)
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: (view.frame.width - 200) / 2, y: 100, width: 200, height: 230)
        logoImageView.isUserInteractionEnabled = true
        let logoTapGesture = UITapGestureRecognizer(target: self, action: #selector(logoTapped))
        logoImageView.addGestureRecognizer(logoTapGesture)
        view.addSubview(logoImageView)

        // 가로 스크롤 이미지 추가
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 500))
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        scrollView.addSubview(stackView)

        // 이미지 4개 추가
        for index in 1...3 {
            let imageView = UIImageView(image: UIImage(named: "man\(index)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
            stackView.addArrangedSubview(imageView)

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(scrollImageTapped(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture)
            imageView.tag = index
        }
        
        stackView.frame = CGRect(x: 0, y: 0, width: CGFloat(300 * 4), height: 500)
        scrollView.contentSize = CGSize(width: CGFloat(300 * 4), height: 500)
    }

    // 로고 클릭 시 ContentViewController로 이동
    @objc func logoTapped() {
        let contentVC = ContentViewController()
        // 네비게이션 스택의 루트로 이동
        self.navigationController?.setViewControllers([contentVC], animated: true)
    }

    // 스크롤 이미지 클릭 시 DetailViewController로 이동
    @objc func scrollImageTapped(_ sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            let detailVC = DetailViewController(selectedIndex: tag)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
