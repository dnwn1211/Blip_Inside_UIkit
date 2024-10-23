import UIKit

class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경 이미지 추가
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "background") // 배경 이미지 이름
        backgroundImageView.contentMode = .scaleAspectFill // 이미지가 화면에 맞게 채우도록 설정
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView) // 배경 이미지를 가장 뒤로 보내기

        // 로고 이미지 추가
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        
        // 이미지 크기 및 위치 설정
        let logoWidth: CGFloat = 230
        let logoHeight: CGFloat = 200
        logoImageView.frame = CGRect(x: 0, y: 50, width: logoWidth, height: logoHeight)
        logoImageView.center.x = view.center.x
        
        view.addSubview(logoImageView)

        // blip_hand_2 이미지 추가 (처음에는 숨김)
        let imageView = UIImageView(image: UIImage(named: "finger"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 200, width: 400, height: 700)
        imageView.center.x = view.center.x
        imageView.alpha = 0 // 처음에 보이지 않게 설정
        view.addSubview(imageView)

        // 캐릭터 이미지를 위한 StackView 생성
        let gridStackView = UIStackView()
        gridStackView.axis = .vertical // 세로 방향으로 쌓기
        gridStackView.spacing = 10 // 이미지 간의 간격
        gridStackView.translatesAutoresizingMaskIntoConstraints = false // Auto Layout 사용

        // 첫째 줄 (3개)
        let firstRowStackView = UIStackView()
        firstRowStackView.axis = .horizontal
        firstRowStackView.spacing = 10
        firstRowStackView.distribution = .fillEqually // 각 이미지 뷰가 동일한 너비를 갖도록 설정
        firstRowStackView.alignment = .center // 수직 중앙 정렬

        // 둘째 줄 (2개)
        let secondRowStackView = UIStackView()
        secondRowStackView.axis = .horizontal
        secondRowStackView.spacing = 10
        secondRowStackView.distribution = .fillEqually
        secondRowStackView.alignment = .center

        // 셋째 줄 (3개)
        let thirdRowStackView = UIStackView()
        thirdRowStackView.axis = .horizontal
        thirdRowStackView.spacing = 10
        thirdRowStackView.distribution = .fillEqually
        thirdRowStackView.alignment = .center

        // zep 이미지 추가
        var characterImageViews: [UIImageView] = [] // 이미지 뷰 배열
        for index in 1...8 {
            let imageName = "zep\(index)"
            let characterImageView = UIImageView(image: UIImage(named: imageName))

            if let image = UIImage(named: imageName) {
                characterImageView.image = image
                print("\(imageName) 이미지 로드 성공") // 로그 추가
            } else {
                print("Image not found: \(imageName)") // 이미지가 없을 경우 로그 추가
            }

            characterImageView.contentMode = .scaleAspectFit
            characterImageView.clipsToBounds = true
            
            // 이미지 뷰를 각각의 행에 추가
            characterImageViews.append(characterImageView) // 이미지 뷰 배열에 추가
            
            switch index {
            case 1, 2, 3:
                firstRowStackView.addArrangedSubview(characterImageView) // 첫째 줄에 추가
            case 4, 5:
                secondRowStackView.addArrangedSubview(characterImageView) // 둘째 줄에 추가
            case 6, 7, 8:
                thirdRowStackView.addArrangedSubview(characterImageView) // 셋째 줄에 추가
            default:
                break
            }
        }

        // StackView를 view에 추가하고 제약 조건 설정
        view.addSubview(gridStackView)
        gridStackView.addArrangedSubview(firstRowStackView)
        gridStackView.addArrangedSubview(secondRowStackView)
        gridStackView.addArrangedSubview(thirdRowStackView)

        // StackView 위치 설정 (위로 올리기 위해 constant 값을 줄임)
        NSLayoutConstraint.activate([
            gridStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100), // 로고 아래에 위치 (값을 줄임)
            gridStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // 수평 중앙 정렬
            gridStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40), // 여백을 고려한 너비
        ])

        // 2초 후 blip_hand_2 이미지 나타나게 설정
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1.0) {
                imageView.alpha = 1 // 이미지 보이기
            }
            
            // zep4~8 이미지를 1초 간격으로 사라지게 설정
            for (index, imageView) in characterImageViews[3...7].enumerated() { // zep4~8 인덱스
                DispatchQueue.main.asyncAfter(deadline: .now() + 3 + Double(index)) {
                    UIView.animate(withDuration: 1.0) {
                        imageView.alpha = 0 // 이미지 사라지기
                    }
                }
            }
            
            // 2초 후 TeamInfoViewController로 전환
            DispatchQueue.main.asyncAfter(deadline: .now() + 8) { // 3초 + 5초 후
                let nextVC = TellViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
}
