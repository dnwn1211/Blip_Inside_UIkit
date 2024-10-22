import UIKit

class MainContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경색을 ContentViewController와 동일하게 설정
        view.backgroundColor = UIColor(red: 1.0, green: 0.694, blue: 0.207, alpha: 1.0)  // 흰색에서 오렌지색으로 변경
              
        self.navigationItem.hidesBackButton = true
        
        // 상단 텍스트 추가
        let label = UILabel()
        label.text = "Blip Inside"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        label.isUserInteractionEnabled = true
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        label.addGestureRecognizer(labelTapGesture)
        view.addSubview(label)

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
        for index in 1...4 {
            let imageView = UIImageView(image: UIImage(named: "man\(index)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
            stackView.addArrangedSubview(imageView)

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture)
            imageView.tag = index
        }
        
        stackView.frame = CGRect(x: 0, y: 0, width: CGFloat(300 * 4), height: 500)
        scrollView.contentSize = CGSize(width: CGFloat(300 * 4), height: 500)
    }

    // 레이블 클릭 시 ContentViewController로 이동
    @objc func labelTapped() {
        let contentVC = ContentViewController()
        // 네비게이션 스택의 루트로 이동
        self.navigationController?.setViewControllers([contentVC], animated: true)
    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            let detailVC = DetailViewController(imageIndex: tag)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


