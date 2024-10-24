import UIKit

class TeamInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        
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
            let imageView = UIImageView(image: UIImage(named: "zep\(index + 4)"))
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
        
        let backgroundHeight: CGFloat = 100
        let pageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "팀 소개"
            label.font = .boldSystemFont(ofSize: 32)
            label.textColor = .white
            
            return label
        }()
        let detailLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "핑거 스냅에서 살아남은 사람들로 구성된 팀 블립은 \n\n전직 최전방 군 간부로 수많은 작전을 성공적으로 수행한 프로젝트 지휘관. 게임과 헬스를 통해 신체와 정신의 한계를 돌파하며, 매 순간 최적의 판단을 내리는 팀플레이의 마에스트로 김석준 \n\n클라이밍에 모든 것을 바친 자연의 개척자. 검은색의 세련됨을 즐기며, 소고기로 에너지를 충전해 고난도의 코스를 정복하는 차세대 클라이밍 브랜드 CEO가 될 양정무 \n\n커피 브루잉의 정교함을 즐기는 미식가이자, 강아지 봄이와의 일상을 차분히 책임지는 헌신적인 보호자. 일상 속 면과 고기, 그리고 올리브 그린으로 취향과 감각을 세련되게 표현하는 박진홍 \n\n위 세 명으로 이루어진 3조의 생존자들입니다."
            label.textColor = .white
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = .systemFont(ofSize: 20)
            
            return label
        }()
        let titleBackground: UIView = {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.backgroundColor = .titleMain
            
            return background
        }()
        let detailBorder: UIView = {
            let border = UIView()
            border.translatesAutoresizingMaskIntoConstraints = false
            border.backgroundColor = .clear
            border.layer.borderColor = UIColor.titleMain.cgColor
            border.layer.borderWidth = 4
            
            return border
        }()
        
        teamIntroVC.view.backgroundColor = .black
        teamIntroVC.view.addSubview(titleBackground)
        teamIntroVC.view.addSubview(pageLabel)
        teamIntroVC.view.addSubview(detailLabel)
        teamIntroVC.view.addSubview(detailBorder)
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: teamIntroVC.view.safeAreaLayoutGuide.topAnchor, constant: backgroundHeight / 2),
            pageLabel.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: teamIntroVC.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleBackground.heightAnchor.constraint(equalToConstant: backgroundHeight),
            titleBackground.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor),
            titleBackground.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor),
            titleBackground.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor),
            
            detailLabel.topAnchor.constraint(equalTo: titleBackground.bottomAnchor, constant: 30),
            detailLabel.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor, constant: 20),
            detailLabel.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor, constant: -20),
            
            detailBorder.topAnchor.constraint(equalTo: detailLabel.topAnchor, constant:  -20),
            detailBorder.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor),
            detailBorder.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor),
            detailBorder.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor)
            
        ])
        detailBorder.heightAnchor.constraint(equalTo: detailLabel.heightAnchor, constant: 40).isActive = true
        
        
        navigationController?.pushViewController(teamIntroVC, animated: true)
    }
    
    @objc func navigateToFeatures() {
        let featuresVC = UIViewController() // 여기에 실제 특징 화면 추가
        
        let backgroundHeight: CGFloat = 100
        let pageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "팀 특징"
            label.font = .boldSystemFont(ofSize: 32)
            label.textColor = .white
            
            return label
        }()
        let detailLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "10.21\n팀원 6명에서 4명으로 감소\n\n10.21\n팀원 4명에서 1명 합류\n\n10.21\n팀원 5명에서 1명 추가 합류\n\n10.22\n팀원 6명에서 1명 감소\n\n10.22\n팀원 5명에서 1명 추가 감소\n\n10.23\n팀원 4명에서 1명 추가 감소\n\n마침내 팀 이름처럼 절반이 사라지고 3명만 남은 블립 탄생!"
            label.textColor = .white
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = .systemFont(ofSize: 20)
            
            return label
        }()
        let titleBackground: UIView = {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.backgroundColor = .titleMain
            
            return background
        }()
        let detailBorder: UIView = {
            let border = UIView()
            border.translatesAutoresizingMaskIntoConstraints = false
            border.backgroundColor = .clear
            border.layer.borderColor = UIColor.titleMain.cgColor
            border.layer.borderWidth = 4
            
            return border
        }()
        
        featuresVC.view.backgroundColor = .black
        featuresVC.view.addSubview(titleBackground)
        featuresVC.view.addSubview(pageLabel)
        featuresVC.view.addSubview(detailLabel)
        featuresVC.view.addSubview(detailBorder)
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: featuresVC.view.safeAreaLayoutGuide.topAnchor, constant: backgroundHeight / 2),
            pageLabel.centerXAnchor.constraint(equalTo: featuresVC.view.centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: featuresVC.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleBackground.heightAnchor.constraint(equalToConstant: backgroundHeight),
            titleBackground.leadingAnchor.constraint(equalTo: featuresVC.view.leadingAnchor),
            titleBackground.trailingAnchor.constraint(equalTo: featuresVC.view.trailingAnchor),
            titleBackground.centerXAnchor.constraint(equalTo: featuresVC.view.centerXAnchor),
            
            detailLabel.topAnchor.constraint(equalTo: titleBackground.bottomAnchor, constant: 30),
            detailLabel.leadingAnchor.constraint(equalTo: featuresVC.view.leadingAnchor, constant: 20),
            detailLabel.trailingAnchor.constraint(equalTo: featuresVC.view.trailingAnchor, constant: -20),
            
            detailBorder.topAnchor.constraint(equalTo: detailLabel.topAnchor, constant:  -20),
            detailBorder.leadingAnchor.constraint(equalTo: featuresVC.view.leadingAnchor),
            detailBorder.trailingAnchor.constraint(equalTo: featuresVC.view.trailingAnchor),
            detailBorder.centerXAnchor.constraint(equalTo: featuresVC.view.centerXAnchor)
            
        ])
        detailBorder.heightAnchor.constraint(equalTo: detailLabel.heightAnchor, constant: 40).isActive = true
        
        navigationController?.pushViewController(featuresVC, animated: true)
    }
    
    @objc func navigateToTrackGoals() {
        let teamIntroVC = UIViewController() // 여기에 실제 팀 소개 화면 추가
        
        let backgroundHeight: CGFloat = 100
        let pageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "트랙 목표"
            label.font = .boldSystemFont(ofSize: 32)
            label.textColor = .white
            
            return label
        }()
        let detailLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "● 포트 폴리오를 2~3개 만들기\n\n● 앱 출시와 운영 경험 쌓기\n\n● 앱스토어 반려에 대한 원인 파악과 대처 능력 기르지\n\n● 개발자들과의 커뮤니케이션 경험 쌓기\n\n● 매일매일 공부하는 습관 들이기"
            label.textColor = .white
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = .systemFont(ofSize: 20)
            
            return label
        }()
        let titleBackground: UIView = {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.backgroundColor = .titleMain
            
            return background
        }()
        let detailBorder: UIView = {
            let border = UIView()
            border.translatesAutoresizingMaskIntoConstraints = false
            border.backgroundColor = .clear
            border.layer.borderColor = UIColor.titleMain.cgColor
            border.layer.borderWidth = 4
            
            return border
        }()
        
        teamIntroVC.view.backgroundColor = .black
        teamIntroVC.view.addSubview(titleBackground)
        teamIntroVC.view.addSubview(pageLabel)
        teamIntroVC.view.addSubview(detailLabel)
        teamIntroVC.view.addSubview(detailBorder)
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: teamIntroVC.view.safeAreaLayoutGuide.topAnchor, constant: backgroundHeight / 2),
            pageLabel.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: teamIntroVC.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleBackground.heightAnchor.constraint(equalToConstant: backgroundHeight),
            titleBackground.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor),
            titleBackground.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor),
            titleBackground.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor),
            
            detailLabel.topAnchor.constraint(equalTo: titleBackground.bottomAnchor, constant: 30),
            detailLabel.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor, constant: 20),
            detailLabel.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor, constant: -20),
            
            detailBorder.topAnchor.constraint(equalTo: detailLabel.topAnchor, constant:  -20),
            detailBorder.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor),
            detailBorder.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor),
            detailBorder.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor)
            
        ])
        detailBorder.heightAnchor.constraint(equalTo: detailLabel.heightAnchor, constant: 40).isActive = true
        
        
        navigationController?.pushViewController(teamIntroVC, animated: true)
    }
    
    @objc func navigateToPromises() {
        let teamIntroVC = UIViewController() // 여기에 실제 팀 소개 화면 추가
        
        let backgroundHeight: CGFloat = 100
        let pageLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "약속"
            label.font = .boldSystemFont(ofSize: 32)
            label.textColor = .white
            
            return label
        }()
        let detailLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "09:00\n출석 체크\n\n09:30 - 10:30\n알고리즘 풀면서 뇌 깨우기\n\n12:00 - 13:00\n점심시간\n\n16:00\n중간 인증\n\n18:00 - 19:00\n저녁시간\n\n19:00 - 20:30\n코드 공유, 의견 나누기\n\n20:30 ~\nTIL 작성하기"
            label.textColor = .white
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = .systemFont(ofSize: 20)
            
            return label
        }()
        let titleBackground: UIView = {
            let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.backgroundColor = .titleMain
            
            return background
        }()
        let detailBorder: UIView = {
            let border = UIView()
            border.translatesAutoresizingMaskIntoConstraints = false
            border.backgroundColor = .clear
            border.layer.borderColor = UIColor.titleMain.cgColor
            border.layer.borderWidth = 4
            
            return border
        }()
        
        teamIntroVC.view.backgroundColor = .black
        teamIntroVC.view.addSubview(titleBackground)
        teamIntroVC.view.addSubview(pageLabel)
        teamIntroVC.view.addSubview(detailLabel)
        teamIntroVC.view.addSubview(detailBorder)
        
        NSLayoutConstraint.activate([
            pageLabel.topAnchor.constraint(equalTo: teamIntroVC.view.safeAreaLayoutGuide.topAnchor, constant: backgroundHeight / 2),
            pageLabel.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor),
            
            titleBackground.topAnchor.constraint(equalTo: teamIntroVC.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleBackground.heightAnchor.constraint(equalToConstant: backgroundHeight),
            titleBackground.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor),
            titleBackground.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor),
            titleBackground.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor),
            
            detailLabel.topAnchor.constraint(equalTo: titleBackground.bottomAnchor, constant: 30),
            detailLabel.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor, constant: 20),
            detailLabel.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor, constant: -20),
            
            detailBorder.topAnchor.constraint(equalTo: detailLabel.topAnchor, constant:  -20),
            detailBorder.leadingAnchor.constraint(equalTo: teamIntroVC.view.leadingAnchor),
            detailBorder.trailingAnchor.constraint(equalTo: teamIntroVC.view.trailingAnchor),
            detailBorder.centerXAnchor.constraint(equalTo: teamIntroVC.view.centerXAnchor)
            
        ])
        detailBorder.heightAnchor.constraint(equalTo: detailLabel.heightAnchor, constant: 40).isActive = true
        
        
        navigationController?.pushViewController(teamIntroVC, animated: true)
    }
    
    // MainContentViewController로 이동 (팀원 소개 클릭 시)
    @objc func navigateToMainContent() {
        let mainContentVC = MainContentViewController()
        navigationController?.pushViewController(mainContentVC, animated: true)
    }
}


import SwiftUI

struct TeamInfoViewPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TeamInfoViewController {
        return TeamInfoViewController()
    }
    
    func updateUIViewController(_ uiViewController: TeamInfoViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = TeamInfoViewController
    
    
    
    
    
}

@available(iOS 13.0.0, *)
struct TeamInfoViewUIPreview: PreviewProvider {
    static var previews: some View {
        TeamInfoViewPreview()
    }
}
