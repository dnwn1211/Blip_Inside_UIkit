import UIKit

class TellViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경색을 검은색으로 설정
        view.backgroundColor = .black
        
        // "Manager" 라벨 추가
        let titleLabel = UILabel()
        titleLabel.textColor = .white // 글씨 색상 설정
        titleLabel.translatesAutoresizingMaskIntoConstraints = false // Auto Layout 사용
        titleLabel.textAlignment = .center // 중앙 정렬

        // 글자 간격을 설정하기 위한 NSMutableAttributedString 생성
        let attributedString = NSMutableAttributedString(string: "Manager")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5 // 줄 간격 설정 (여기서 5는 원하는 간격)

        // 속성 설정
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 50), range: NSRange(location: 0, length: attributedString.length)) // 글씨 크기 및 스타일

        titleLabel.attributedText = attributedString // 라벨에 설정

        // 라벨을 뷰에 추가
        view.addSubview(titleLabel)

        // "manage" 이미지 추가
        let manageImageView = UIImageView(image: UIImage(named: "manage"))
        manageImageView.contentMode = .scaleAspectFit // 이미지 모드 설정
        manageImageView.translatesAutoresizingMaskIntoConstraints = false // Auto Layout 사용
        manageImageView.layer.opacity = 0.5

        // "X" 이미지 추가
        let xImageView = UIImageView(image: UIImage(named: "X"))
        xImageView.contentMode = .scaleAspectFit // 이미지 모드 설정
        xImageView.translatesAutoresizingMaskIntoConstraints = false // Auto Layout 사용

        // "O" 이미지 추가
        let oImageView = UIImageView(image: UIImage(named: "O"))
        oImageView.contentMode = .scaleAspectFit // 이미지 모드 설정
        oImageView.translatesAutoresizingMaskIntoConstraints = false // Auto Layout 사용

        // "X" 및 "O" 이미지를 뷰에 추가
        view.addSubview(manageImageView)
        view.addSubview(xImageView)
        view.addSubview(oImageView)
        // manage 이미지도 뷰에 추가

        // 제약 조건 설정
        NSLayoutConstraint.activate([
            // Title Label 제약 조건
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60), // 상단 여백
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // 수평 중앙 정렬
            
            // manage 이미지 제약 조건
            manageImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // 수평 중앙 정렬
            manageImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10), // 라벨 아래에 위치 (여백을 60으로 설정하여 더 아래로)
            manageImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.8), // 너비 비율
            manageImageView.heightAnchor.constraint(equalTo: manageImageView.widthAnchor), // 정사각형 비율
            
            // X 이미지 제약 조건
            xImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // 왼쪽 여백
            xImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100), // 아래쪽 여백
            xImageView.widthAnchor.constraint(equalToConstant: 130), // 너비 100
            xImageView.heightAnchor.constraint(equalToConstant: 130), // 높이 100
            
            // O 이미지 제약 조건
            oImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // 오른쪽 여백
            oImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100), // 아래쪽 여백
            oImageView.widthAnchor.constraint(equalToConstant: 130), // 너비 100
            oImageView.heightAnchor.constraint(equalToConstant: 130) // 높이 100
        ])

        // O 이미지에 Tap Gesture Recognizer 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(oImageTapped))
        oImageView.isUserInteractionEnabled = true // 이미지에 사용자 상호작용 활성화
        oImageView.addGestureRecognizer(tapGesture) // 제스처 인식기 추가
    }

    // O 이미지가 클릭되었을 때 호출되는 메서드
    @objc func oImageTapped() {
        let nextVC = TeamInfoViewController() // TeamInfoViewController 인스턴스 생성
        self.navigationController?.pushViewController(nextVC, animated: true) // 화면 전환
    }
}

 
import SwiftUI
struct TellViewPreview: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: TellViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = TellViewController
    
    func makeUIViewController(context: Context) -> TellViewController {
        return TellViewController()
    }
}

@available(iOS 13.0.0, *)
struct TellViewUIPreview: PreviewProvider {
    static var previews: some View {
        TellViewPreview()
    }
}
