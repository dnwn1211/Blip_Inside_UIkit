import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    var person: Person
    private let screenHeight = UIScreen.main.bounds.height

    // imageIndex를 위한 새로운 초기화 메서드
    init(imageIndex: Int) {
        switch imageIndex {
        case 1:
            self.person = Person(
                name: "김석준",
                hashtag: "#파란색 #해산물NO #게임 #헬스 #옷구경 #돌림판",
                imageName: "man1",
                tmi: "장점: 최대한 긍정적으로 생각하기 \n협업스타일: 최대한 맞추려고 노력하고 협업을 하다가 이건 아니다 싶을 때 즉각적인 질문과 피드백으로 빠르게 문제 상황을 해결하는 것을 좋아합니다.",
                socialLinks: [
                    "https://github.com",
                    "https://instagram.com",
                    "https://www.google.com"
                ]
            )
        case 2:
            self.person = Person(
                name: "양정무",
                hashtag: "#검은색 #소고기 #클라이밍 #클라이밍 러버 #브랜드",
                imageName: "man2",
                tmi: "장점: 빠른 상황판단 \n협업 스타일: 최대한 협조하기",
                socialLinks: [
                    "https://github.com/kimsukjun",
                    "https://instagram.com/kimsukjun",
                    "mailto:kimsukjun@gmail.com"
                ]
            )
        case 3:
            self.person = Person(
                name: "박진홍",
                hashtag: "#올리브 그린 #면과고기조합 #커피 브루잉 #강아지 #봄이 #배변 #산책",
                imageName: "man3",
                tmi: "장점: 이해와 응용이 빠른편입니다. \n협업스타일: 반드시 반대해야 할 이유나 비합리적인 선택만 아니라면 대부분의 의견에 동의하고 잘 따라가는 편입니다.",
                socialLinks: [
                    "https://github.com/kimsukjun",
                    "https://instagram.com/kimsukjun",
                    "mailto:kimsukjun@gmail.com"
                ]
            )
        case 4:
            self.person = Person(
                name: "박준혁",
                hashtag: "#네이비 #먹보 #라이딩 #차",
                imageName: "man4",
                tmi: "장점: 포기하지 않고 끝까지 해결하기 \n협업스타일: 의견을 많이 들으려하고 생산적인 회의를 좋아합니다.",
                socialLinks: [
                    "https://github.com/kimsukjun",
                    "https://instagram.com/kimsukjun",
                    "mailto:kimsukjun@gmail.com"
                ]
            )
        default:
            self.person = mockData
        }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Create social media buttons
    var socialButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    var hashtagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var tmiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    var spacer: UIView = {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.backgroundColor = .clear
        return spacer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        setupDetailView()
        setupUI()
        configurePerson()
    }
    
    func setupDetailView() {
        view.addSubview(profileImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.delegate = self
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(hashtagLabel)
        contentView.addSubview(tmiLabel)
        contentView.addSubview(socialButtonsStackView)
        contentView.addSubview(spacer)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 600),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 620),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            hashtagLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            hashtagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            hashtagLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hashtagLabel.heightAnchor.constraint(equalToConstant: 50),
            
            tmiLabel.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 10),
            tmiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            tmiLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Social Buttons StackView layout
            socialButtonsStackView.topAnchor.constraint(equalTo: tmiLabel.bottomAnchor, constant: 20),
            socialButtonsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            spacer.topAnchor.constraint(equalTo: socialButtonsStackView.bottomAnchor, constant: 20),
            spacer.heightAnchor.constraint(equalToConstant: screenHeight - (nameLabel.frame.height + hashtagLabel.frame.height + tmiLabel.frame.height + 40)),
            
            spacer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func configurePerson() {
        profileImageView.image = UIImage(named: person.imageName)
        nameLabel.text = person.name
        hashtagLabel.text = person.hashtag
        tmiLabel.text = person.tmi
        
        for (index, link) in person.socialLinks.enumerated() {
            let button = UIButton(type: .system)
            
            switch index {
            case 0:
                button.setImage(UIImage(named: "git"), for: .normal) // GitHub 아이콘
            case 1:
                button.setImage(UIImage(named: "instagram"), for: .normal) // Instagram 아이콘
            case 2:
                button.setImage(UIImage(named: "blog"), for: .normal) // 이메일 아이콘
            default:
                button.setImage(UIImage(systemName: "link"), for: .normal) // 기본 링크 아이콘
            }
            
            button.tintColor = .purple
            button.addTarget(self, action: #selector(socialButtonTapped(_:)), for: .touchUpInside)
            button.tag = index
            socialButtonsStackView.addArrangedSubview(button)
        }
    }

    
    @objc func socialButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        if index < person.socialLinks.count, let url = URL(string: person.socialLinks[index]) {
            UIApplication.shared.open(url)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let imageHeight = profileImageView.frame.height
        let alpha = 1 - (offsetY / imageHeight)
        profileImageView.alpha = max(0, alpha)
    }
}

// Person 구조체
struct Person {
    let name: String
    let hashtag: String
    let imageName: String
    let tmi: String
    let socialLinks: [String]
}

// 테스트용 mockData
let mockData: Person = Person(name: "코카콜라", hashtag: "#콜라 #펩시 #사이다", imageName: "man4", tmi: "코카콜라의 원래 색은 초록색이었다는 사실 알고 있었어?", socialLinks: ["https://github.com", "https://instagram.com"])
