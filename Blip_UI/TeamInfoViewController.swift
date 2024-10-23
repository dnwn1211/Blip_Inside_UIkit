import UIKit

class TeamInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black // 배경색 설정
        
        // 팀 로고 이미지 추가
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        
        // 이미지 크기 설정
        let logoWidth: CGFloat = view.frame.width - 40 // 좌우 여백을 고려한 너비
        let logoHeight: CGFloat = 260 // 원하는 높이
        logoImageView.frame = CGRect(x: 20, y: 100, width: logoWidth, height: logoHeight) // 이미지 위치 및 크기 설정
        logoImageView.center = CGPoint(x: view.frame.midX, y: logoImageView.frame.midY) // 중앙에 위치시키기
        view.addSubview(logoImageView)
        
        // 각 레이블의 yPosition을 설정하여 중앙 정렬
        let yPosition = CGFloat(370) // 첫 번째 레이블의 Y 위치 (로고 아래에 위치)

        // 레이블과 이미지를 추가
        let labelsInfo = [
            ("팀 소개", #selector(navigateToTeamIntro)),
            ("팀원 소개", #selector(navigateToMainContent)),
            ("특징", #selector(navigateToFeatures)),
            ("트랙 목표", #selector(navigateToTrackGoals)),
            ("약속", #selector(navigateToPromises))
        ]
        
        for (index, info) in labelsInfo.enumerated() {
            let (text, action) = info
            let yPos = yPosition + CGFloat(index * 60) // Y 위치 계산
            
            // StackView를 생성하여 이미지와 레이블을 수평으로 배치
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = -20 // 이미지와 레이블 간의 간격을 설정 (조정 가능)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            // 이미지 추가
            let imageView = UIImageView(image: UIImage(named: "zep\(index + 1)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40) // 이미지 크기 설정
            
            // 레이블 추가
            let label = createClickableLabel(text: text, action: action)
            label.translatesAutoresizingMaskIntoConstraints = false // 제약 조건을 설정하기 위해 필요
            
            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(label)
            
            view.addSubview(stackView)
            
            // StackView 제약 조건 설정
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: yPos),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                stackView.heightAnchor.constraint(equalToConstant: 40)
            ])
            
            // 레이블 중앙 정렬 제약 조건 추가
            NSLayoutConstraint.activate([
                label.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
                label.widthAnchor.constraint(equalToConstant: 200) // 레이블의 너비를 설정하여 중앙 정렬
            ])
        }
    }
    
    // 클릭 가능한 레이블 생성 함수
    func createClickableLabel(text: String, action: Selector) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 25) // 폰트 사이즈를 20으로 키우고 볼드 스타일 적용
        label.textColor = .white // 텍스트 색상을 흰색으로 설정
        label.textAlignment = .left // 레이블을 중앙 정렬
        label.isUserInteractionEnabled = true // 사용자 인터랙션 활성화
        
        // 탭 제스처 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        label.addGestureRecognizer(tapGesture)

        return label
    }


    // 각 레이블 클릭 시 이동할 화면으로의 네비게이션 함수
    @objc func navigateToTeamIntro() {
        let teamIntroVC = UIViewController() // 여기에 실제 팀 소개 화면 추가
        teamIntroVC.view.backgroundColor = .white
        teamIntroVC.title = "팀 소개"
        navigationController?.pushViewController(teamIntroVC, animated: true)
    }
    
    @objc func navigateToFeatures() {
        let featuresVC = UIViewController() // 여기에 실제 특징 화면 추가
        featuresVC.view.backgroundColor = .white
        featuresVC.title = "특징"
        navigationController?.pushViewController(featuresVC, animated: true)
    }
    
    @objc func navigateToTrackGoals() {
        let trackGoalsVC = UIViewController() // 여기에 실제 트랙 목표 화면 추가
        trackGoalsVC.view.backgroundColor = .white
        trackGoalsVC.title = "트랙 목표"
        navigationController?.pushViewController(trackGoalsVC, animated: true)
    }

    @objc func navigateToPromises() {
        let promisesVC = UIViewController() // 여기에 실제 약속 화면 추가
        promisesVC.view.backgroundColor = .white
        promisesVC.title = "약속"
        navigationController?.pushViewController(promisesVC, animated: true)
    }
    
    // MainContentViewController로 이동 (팀원 소개 클릭 시)
    @objc func navigateToMainContent() {
        let mainContentVC = MainContentViewController()
        navigationController?.pushViewController(mainContentVC, animated: true)
    }
}
