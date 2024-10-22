import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    var person: Person = mockData
    private let screenHeight = UIScreen.main.bounds.height
    
    init(person: Person) {
        self.person = person
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error")
    }
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = UIColor(Color("BackgroundColor"))
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
        //볼드체, 폰트사이즈 26
        label.font = UIFont.boldSystemFont(ofSize: 26)
        
        return label
    }()
    
    var hashtagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //볼드체, 폰트사이즈 20
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var tmiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //일반 글꼴, 폰트사이즈 18
        label.font = UIFont.systemFont(ofSize: 18)
        //여러줄 표시용 설정
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
        
        //네비 바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: false)
        //배경색 설정
        view.backgroundColor = UIColor(Color("BackgroundColor"))
        
        setupDetailView()
        setupUI()
        configurePerson()
    }
    
    //스크롤뷰, 콘텐츠 뷰 설정 메서드
    func setupDetailView() {
        view.addSubview(profileImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.delegate = self
        
        //오토 레이아웃 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            //가로 스크롤 방지용 설정
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    //요소들 콘텐츠뷰에 추가, 레이아웃 설정
    func setupUI() {
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(hashtagLabel)
        contentView.addSubview(tmiLabel)
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
           //spacer
            spacer.topAnchor.constraint(equalTo: tmiLabel.bottomAnchor),
            spacer.heightAnchor.constraint(equalToConstant: screenHeight -  (nameLabel.frame.height + hashtagLabel.frame.height + tmiLabel.frame.height)),
            
            //마지막 요소 하단 제약 >> 추후 url 담은 버튼으로 교체
            spacer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
        ])
    }
    
    //데이터 반영하기
    func configurePerson() {
        profileImageView.image = UIImage(named: person.imageName)
        nameLabel.text = person.name
        hashtagLabel.text = person.hashtag
        tmiLabel.text = person.tmi
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let imageHeight = profileImageView.frame.height
        
        let alpha = 1 - (offsetY / imageHeight)
        profileImageView.alpha = max(0, alpha)
    }
}


//테스트용
struct Person {
    let name: String
    let hashtag: String
    let imageName: String
    let tmi: String
}

let mockData: Person = Person(name: "코카콜라", hashtag: "#콜라 #펩시 #사이다", imageName: "man4", tmi: "코카콜라의 원래 색은 사실 초록색이었다는 거 알고 있었어? 코카콜라가 처음 만들어졌을 때는 병에 든 음료가 약간 초록빛을 띠는 특이한 색이었대. 지금처럼 갈색이 된 건 나중에 설탕 시럽과 여러 성분들이 추가되면서 바뀐 거지!")
import SwiftUI

struct Preview: UIViewControllerRepresentable {
    typealias UIViewControllerType = DetailViewController
    
    func makeUIViewController(context: Context) -> DetailViewController {
        return DetailViewController(person: mockData)
    }
    
    func updateUIViewController(_ uiViewController: DetailViewController, context: Context) {
        
    }
    
}
    
    
    @available(iOS 13.0.0, *)
    struct UIPreview: PreviewProvider {
        static var previews: some View {
            Preview()
        }
    }
