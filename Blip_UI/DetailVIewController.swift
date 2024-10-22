import UIKit

class DetailViewController: UIViewController {
    var imageIndex: Int
    
    init(imageIndex: Int) {
        self.imageIndex = imageIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 배경색 설정
        view.backgroundColor = UIColor(red: 1.0, green: 0.694, blue: 0.207, alpha: 1.0)
        
        // imageIndex에 따라 다른 내용 표시 - socialLinks 추가
        let (image, title, hashtags, description, socialLinks) = getContentForIndex(imageIndex)
        
        // 이미지 추가
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 400)
        view.addSubview(imageView)
        
        // 제목 텍스트
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.frame = CGRect(x: 20, y: imageView.frame.maxY, width: view.frame.width - 40, height: 50)
        view.addSubview(titleLabel)
        
        // 해시태그
        let hashtagLabel = UILabel()
        hashtagLabel.text = hashtags
        hashtagLabel.font = .systemFont(ofSize: 16)
        hashtagLabel.textAlignment = .left
        hashtagLabel.numberOfLines = 0  // 여러 줄 허용
        hashtagLabel.lineBreakMode = .byWordWrapping  // 단어 단위로 줄바꿈

        // 텍스트 크기에 맞게 레이블 크기 조정
        let hashtagSize = hashtagLabel.sizeThatFits(CGSize(width: view.frame.width - 40, height: .greatestFiniteMagnitude))
        hashtagLabel.frame = CGRect(x: 20,
                                  y: titleLabel.frame.maxY + 5,
                                  width: view.frame.width - 40,
                                  height: hashtagSize.height)  // 높이를 내용에 맞게 조정
        view.addSubview(hashtagLabel)
        
        // 설명 텍스트를 위한 스크롤뷰 추가
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 20,
                                 y: hashtagLabel.frame.maxY + 10,
                                 width: view.frame.width - 40,
                                 height: 200)  // 스크롤뷰의 높이 설정
        view.addSubview(scrollView)

        // 설명 텍스트
        let descriptionLabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.font = .systemFont(ofSize: 20)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left

        // 텍스트 크기에 맞게 레이블 크기 조정
        let size = descriptionLabel.sizeThatFits(CGSize(width: scrollView.frame.width,
                                                       height: CGFloat.greatestFiniteMagnitude))
        descriptionLabel.frame = CGRect(x: 0,
                                      y: 0,
                                      width: scrollView.frame.width,
                                      height: size.height)

        scrollView.addSubview(descriptionLabel)
        scrollView.contentSize = CGSize(width: scrollView.frame.width,
                                      height: descriptionLabel.frame.height)
        
        // 소셜 미디어 아이콘들
        let socialStack = UIStackView()
        socialStack.axis = .horizontal
        socialStack.spacing = 20
        socialStack.distribution = .fillEqually
        socialStack.frame = CGRect(x: 20, y: view.frame.height - 80, width: 120, height: 30)
        
        let icons = ["git", "instagram", "gmail"]
        for (index, iconName) in icons.enumerated() {
            let iconImage = UIImageView(image: UIImage(named: iconName))
            iconImage.contentMode = .scaleAspectFit
            iconImage.tintColor = .white
            iconImage.isUserInteractionEnabled = true
            iconImage.tag = index
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openSocialLink(_:)))
            iconImage.addGestureRecognizer(tapGesture)
            
            socialStack.addArrangedSubview(iconImage)
        }
        
        view.addSubview(socialStack)
    }

    @objc func openSocialLink(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        let (_, _, _, _, socialLinks) = getContentForIndex(imageIndex)
        
        if tag < socialLinks.count {
            if let url = URL(string: socialLinks[tag]),
               UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    // imageIndex에 따라 다른 내용을 반환하는 함수
    private func getContentForIndex(_ index: Int) -> (image: String, title: String, hashtags: String, description: String, socialLinks: [String]) {
        switch index {
        case 1:
            return (
                image: "man1",
                title: "김석준",
                hashtags: "#파란색 #해산물NO #게임 #헬스 #옷구경 #돌림판",
                description: "장점: 최대한 긍정적으로 생각하기 \n협업스타일: 최대한 맞추려고 노력하고 협업을 하다가 이건 아니다 싶을 때 즉각적인 질문과 피드백으로 빠르게 문제 상황을 해결하는 것을 좋아 합니다\n\n\n\n\n\n\n\n\n\n\n\n",
                socialLinks: [
                               "https://github.com",
                               "https://instagram.com",
                               "https://www.google.com"
                           ]
            )
        case 2:
            return (
                image: "man2",
                title: "양정무",
                hashtags: "#검은색 #소고기 #클라이밍 #클라이밍 러버 #브랜드",
                description: "장점: 빠른 상황판단 \n협업 스타일: 최대한 협조하기",
                socialLinks: [
                               "https://github.com/kimsukjun",
                               "https://instagram.com/kimsukjun",
                               "mailto:kimsukjun@gmail.com"
                           ]
            )
        case 3:
            return (
                image: "man3",
                title: "박진홍",
                hashtags: "#올리브 그린 #면과고기조합 #커피 브루잉 #강아지 #봄이 #배변 #산책",
                description: "장점: 이해와 응용이 빠른편입니다. \n협업스타일: 반드시 반대해야 할 이유나 비합리적인 선택만 아니라면 대부분의 의견에 동의하고 잘 따라가는 편이며 리더로 이끌어나가기보다 따라가며 디테일한 부분을 챙기는 편을 좋아합니다.",
                socialLinks: [
                               "https://github.com/kimsukjun",
                               "https://instagram.com/kimsukjun",
                               "mailto:kimsukjun@gmail.com"
                           ]
            )
        case 4:
            return (
                image: "man4",
                title: "박준혁",
                hashtags: "#네이비 #먹보 #라이딩 #차",
                description: "장점: 포기하지 않고 끝까지 해결하기 \n협업스타일: 의견을 많이 들으려하고 생산적인 회의를 좋아합니다",
                socialLinks: [
                               "https://github.com/kimsukjun",
                               "https://instagram.com/kimsukjun",
                               "mailto:kimsukjun@gmail.com"
                           ]
            )
        default:
            return (
                "default",
                "기본 제목",
                "#기본 #해시태그",
                "기본 설명 텍스트입니다.",
                socialLinks: [
                             "https://github.com",
                             "https://instagram.com",
                             "mailto:example@gmail.com"
                         ]
            )
        }
    }
}

