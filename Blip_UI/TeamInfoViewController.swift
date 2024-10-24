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
        // 새로운 뷰 컨트롤러 생성
        let trackGoalsVC = UIViewController()
        trackGoalsVC.view.backgroundColor = .black  // 배경색 검정으로 설정
        trackGoalsVC.title = "트랙 목표"
        
        // 스크롤뷰 생성
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        trackGoalsVC.view.addSubview(scrollView)
        
        // 스크롤뷰 제약조건 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: trackGoalsVC.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: trackGoalsVC.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trackGoalsVC.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: trackGoalsVC.view.bottomAnchor)
        ])
        
        // 상단 핑크색 배너 생성
        let bannerView = UIView()
        bannerView.backgroundColor = UIColor(red: 250/255, green: 87/255, blue: 83/255, alpha: 1) // #FA5753 색상
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(bannerView)
        
        // 배너 제약조건 설정
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 80),
            bannerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // 배너 텍스트 ("트랙 목표") 추가
        let bannerLabel = UILabel()
        bannerLabel.text = "트랙 목표"
        bannerLabel.font = .boldSystemFont(ofSize: 24)
        bannerLabel.textColor = .white
        bannerLabel.textAlignment = .center
        bannerLabel.translatesAutoresizingMaskIntoConstraints = false
        bannerView.addSubview(bannerLabel)
        
        // 배너 텍스트 제약조건 설정
        NSLayoutConstraint.activate([
            bannerLabel.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor),
            bannerLabel.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor)
        ])
        
        // 목표 리스트를 감싸는 테두리 뷰 생성
        let borderView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.layer.borderWidth = 2  // 테두리 두께
        borderView.layer.borderColor = UIColor(red: 250/255, green: 87/255, blue: 83/255, alpha: 1).cgColor  // #FA5753 색상
        borderView.layer.cornerRadius = 10  // 테두리 모서리 둥글게
        scrollView.addSubview(borderView)
        
        // 목표 리스트를 포함하는 컨테이너 뷰
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        borderView.addSubview(containerView)
        
        // 컨테이너 뷰 제약조건 설정
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -20)
        ])
        
        // 목표 데이터 설정
        let goals = [
            "포트폴리오를 2~3개 만들기",
            "앱 출시와 운영 경험 쌓기",
            "앱스토어 반려에 대한 원인 파악과 대처 능력 기르기",
            "개발자들과의 커뮤니케이션 경험 쌓기",
            "매일매일 공부하는 습관 들이기"
        ]
        
        var previousAnchor = containerView.topAnchor
        
        // 목표 항목들을 하나씩 추가
        for (index, goal) in goals.enumerated() {
            // 불릿 포인트와 목표를 담을 스택 뷰
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 10
            stackView.alignment = .top
            stackView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(stackView)
            
            // 불릿 포인트 레이블
            let bulletLabel = UILabel()
            bulletLabel.text = "•"
            bulletLabel.font = .systemFont(ofSize: 20)
            bulletLabel.textColor = .white
            bulletLabel.setContentHuggingPriority(.required, for: .horizontal)
            
            // 목표 텍스트 레이블
            let goalLabel = UILabel()
            goalLabel.text = goal
            goalLabel.font = .systemFont(ofSize: 20)
            goalLabel.textColor = .white
            goalLabel.numberOfLines = 0
            
            // 스택 뷰에 레이블들 추가
            stackView.addArrangedSubview(bulletLabel)
            stackView.addArrangedSubview(goalLabel)
            
            // 스택 뷰 제약조건 설정
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: previousAnchor, constant: index == 0 ? 0 : 20),
                stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
            
            previousAnchor = stackView.bottomAnchor
        }
        
        // 테두리 뷰의 제약조건 설정
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 40),
            borderView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            borderView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
        
        // 마지막 여백을 위한 제약조건 설정
        NSLayoutConstraint.activate([
            previousAnchor.constraint(equalTo: containerView.bottomAnchor),
            borderView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
        
        // 화면 전환
        navigationController?.pushViewController(trackGoalsVC, animated: true)
    }
    
    @objc func navigateToPromises() {
        // 새로운 뷰 컨트롤러 생성
        let promisesVC = UIViewController()
        promisesVC.view.backgroundColor = .black  // 배경색 검정으로 설정
        promisesVC.title = "약속"
        
        // 스크롤뷰 생성 (컨텐츠가 화면을 넘어갈 경우를 대비)
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        promisesVC.view.addSubview(scrollView)
        
        // 스크롤뷰 제약조건 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: promisesVC.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: promisesVC.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: promisesVC.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: promisesVC.view.bottomAnchor)
        ])
        
        // 상단 핑크색 배너 생성
        let bannerView = UIView()
        bannerView.backgroundColor = UIColor(red: 250/255, green: 87/255, blue: 83/255, alpha: 1) // #FA5753 색상
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(bannerView)
        
        // 배너 제약조건 설정
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 80),
            bannerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // 배너 텍스트 ("약속") 추가
        let bannerLabel = UILabel()
        bannerLabel.text = "약속"
        bannerLabel.font = .boldSystemFont(ofSize: 24)
        bannerLabel.textColor = .white
        bannerLabel.textAlignment = .center
        bannerLabel.translatesAutoresizingMaskIntoConstraints = false
        bannerView.addSubview(bannerLabel)
        
        // 배너 텍스트 제약조건 설정
        NSLayoutConstraint.activate([
            bannerLabel.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor),
            bannerLabel.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor)
        ])
        
        // Time Table 섹션을 감싸는 테두리 뷰 생성
        let borderView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.layer.borderWidth = 2  // 테두리 두께
        borderView.layer.borderColor = UIColor(red: 250/255, green: 87/255, blue: 83/255, alpha: 1).cgColor  // #FA5753 색상
        borderView.layer.cornerRadius = 10  // 테두리 모서리 둥글게
        scrollView.addSubview(borderView)
        
        // Time Table 타이틀과 시간표를 포함하는 컨테이너 뷰
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        borderView.addSubview(containerView)
        
        // 컨테이너 뷰 제약조건 설정
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -20)
        ])
        
        // Time Table 타이틀 생성
        let titleLabel = UILabel()
        titleLabel.text = "Time Table"
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        // Time Table 타이틀 제약조건 설정
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        // 시간표 데이터 설정
        let schedules = [
            ("09:00", "출석 체크"),
            ("09:30 - 10:30", "알고리즘 풀면서 뇌 깨우기"),
            ("12:00 - 13:00", "점심시간"),
            ("16:00", "중간 인증"),
            ("18:00 - 19:00", "저녁시간"),
            ("19:00 - 20:30", "코드 공유, 의견 나누기"),
            ("20:30 ~", "TIL 작성하기")
        ]
        
        var previousAnchor = titleLabel.bottomAnchor
        
        // 시간표 항목들을 하나씩 추가
        for (time, activity) in schedules {
            // 시간 레이블 생성
            let timeLabel = UILabel()
            timeLabel.text = time
            timeLabel.font = .boldSystemFont(ofSize: 20)
            timeLabel.textColor = .white
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(timeLabel)
            
            // 활동 내용 레이블 생성
            let activityLabel = UILabel()
            activityLabel.text = activity
            activityLabel.font = .systemFont(ofSize: 20)
            activityLabel.textColor = .white
            activityLabel.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(activityLabel)
            
            // 레이블들의 제약조건 설정
            NSLayoutConstraint.activate([
                timeLabel.topAnchor.constraint(equalTo: previousAnchor, constant: 30),
                timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                
                activityLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
                activityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                activityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
            
            previousAnchor = activityLabel.bottomAnchor
        }
        
        // 테두리 뷰의 제약조건 설정
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 40),
            borderView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            borderView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
        
        // 마지막 여백을 위한 제약조건 설정
        NSLayoutConstraint.activate([
            previousAnchor.constraint(equalTo: containerView.bottomAnchor),
            borderView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
        
        // 화면 전환
        navigationController?.pushViewController(promisesVC, animated: true)
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
