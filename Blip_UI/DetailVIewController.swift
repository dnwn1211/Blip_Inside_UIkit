
import UIKit

let mockData: [Person] = [
    Person(
        name: "김석준",
        hashtag: "#ISTP #파란색 #해산물NO #게임",
        imageName: "1",
        tmi: "장점: 최대한 긍정적으로 생각하기 \n\n협업스타일: 최대한 맞추려고 노력하고 협업을 하다가 이건 아니다 싶을 때 즉각적인 질문과 피드백으로 빠르게 문제 상황을 해결하는 것을 좋아합니다.",
        socialLinks: [
            "https://github.com",
            "https://instagram.com",
            "https://www.google.com"
        ]
    ),
    Person(
        name: "양정무",
        hashtag: "#INTP #검은색 #소고기 #클라이밍",
        imageName: "2",
        tmi: "장점: 빠르게 상황판단하고 행동하기 \n\n협업 스타일: 최대한 팀원과 리더의 의견에 협조하기",
        socialLinks: [
            "https://github.com/kimsukjun",
            "https://instagram.com/kimsukjun",
            "mailto:kimsukjun@gmail.com"
        ]
    ),
    Person(
        name: "박진홍",
        hashtag: "#INTJ #올리브그린 #커피 #강아지",
        imageName: "3",
        tmi: "장점: 비교적 빠른 이해와 응용 \n\n협업스타일: 팀원의 의견에 대한 근거나 이유를 생각해보고 비합리적인 선택만 아니라면 대부분의 의견에 동의하고 잘 따라가는 편입니다.",
        socialLinks: [
            "https://github.com/kimsukjun",
            "https://instagram.com/kimsukjun",
            "mailto:kimsukjun@gmail.com"
        ]
    )
]

class DetailViewController: UIViewController {
    
    // PageVC 에서 내부적으로 PageContentVC 의 View 를 자신의 View 에서 교체하면서 보여줌
    private var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    // PageVC 에서 보여줄 Page 를 담고 있는 프로퍼티
    private var pages: [PageContentViewController] = []
    
    // 현재 Page 의 인덱스를 갖고 있는 프로퍼티
    // DetailView 가 초기화 될때 해당 인덱스의 VC 를 보여주기 위함
    private var currentIndex: Int
    
    init(selectedIndex: Int) {
        self.currentIndex = selectedIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비 바 숨기기
        navigationController?.setNavigationBarHidden(false, animated: true)
        //배경색 설정
        view.backgroundColor = .background
        
        setupPageViewController()
        setupDelegate()
    }
    
    // 페이지로 사용할 뷰컨트롤러들 생성
    func setupPageViewController() {
        
        // 데이터 배열로 ContentViewController 생성
        self.pages = mockData.map { item in
            PageContentViewController(person: item)
        }
        
        // 초기 페이지 설정
        pageViewController.setViewControllers(
            [pages[currentIndex]],
            direction: .forward,
            animated: true
        )
        
        // PageVC 는 Container VC 이므로 자식 VC 의 생명주기를 관리하기 위해 부모 - 자식 관계형성
        addChild(pageViewController)
        
        // 뷰를 추가 (뷰 계층)
        view.addSubview(pageViewController.view)
        pageViewController.view.frame = view.bounds
        
        // 자식 뷰컨트롤러에게 이동이 완료됐음을 알림
        pageViewController.didMove(toParent: self)
    }
    
    /// PageViewController의 DataSource와 Delegate를 설정하는 메서드
    /// - Note:
    ///   - DataSource: 페이지 콘텐츠와 순서를 관리 (이전/다음 페이지를 제공)
    ///   - Delegate: 페이지 전환 상태 및 이벤트를 처리
    func setupDelegate() {
        // 페이지 순서와 내용을 관리하는 DataSource 설정
        pageViewController.dataSource = self
        
        // 페이지 전환 이벤트를 처리하는 Delegate 설정
        pageViewController.delegate = self
    }
}

extension DetailViewController: UIPageViewControllerDataSource{
    /// 이전 페이지의 ViewController를 반환
    /// - Parameters:
    ///   - pageViewController: 현재 PageViewController
    ///   - viewController: 현재 표시된 ViewController
    /// - Returns: 이전 페이지의 ViewController. 첫 페이지인 경우 nil 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 1. 현재 ViewController가 PageContentViewController 타입인지
        // 2. 현재 ViewController가 pages 배열에 있는지
        // 3. 이전 페이지가 존재하는지 (현재 인덱스가 마지막이 아닌지)
        guard let currentVC = viewController as? PageContentViewController,
              let index = pages.firstIndex(of: currentVC),
              index > 0 else {
            return nil
        }
        return pages[index - 1]
    }
    
    /// 다음 페이지의 ViewController를 반환
    /// - Parameters:
    ///   - pageViewController: 현재 PageViewController
    ///   - viewController: 현재 표시된 ViewController
    /// - Returns: 다음 페이지의 ViewController. 마지막 페이지인 경우 nil 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // 1. 현재 ViewController가 PageContentViewController 타입인지
        // 2. 현재 ViewController가 pages 배열에 있는지
        // 3. 다음 페이지가 존재하는지 (현재 인덱스가 마지막이 아닌지)
        guard let currentVC = viewController as? PageContentViewController,
              let index = pages.firstIndex(of: currentVC),
              index < pages.count - 1 else {
            return nil
        }
        return pages[index + 1]
    }
}

extension DetailViewController: UIPageViewControllerDelegate {
    /// 페이지 전환이 완료된 후 호출되는 메서드
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // 전환이 완료되었고 현재 보여줄 VC 가 PageContentVC 유형이고, 해당 VC 가 pages 배열에 존재하는지 확인
        if completed,
           let currentVC = pageViewController.viewControllers?.first as? PageContentViewController,
           let index = pages.firstIndex(of: currentVC) {
            currentIndex = index
        }
    }
}

import SwiftUI

struct Preview: UIViewControllerRepresentable {
    typealias UIViewControllerType = DetailViewController
    
    func makeUIViewController(context: Context) -> DetailViewController {
        return DetailViewController(selectedIndex: 0)
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
