# Blip Inside 

**Blip Inside**는 사용자가 다양한 콘텐츠를 탐색하고 팀원 정보를 확인할 수 있는 iOS 앱입니다. 이 앱은 팀원 소개, 특징, 트랙 목표, 약속 등 여러 페이지로 구성되어 있으며, 사용자는 팀원 정보를 쉽게 탐색하고 상세 정보에 접근할 수 있습니다.

## 목차
- [기능](#기능)
- [언어](#언어)
- [설치 방법](#설치-방법)
- [사용법](#사용법)
- [스크린샷](#스크린샷)
- [기여자](#기여자)
- [라이선스](#라이선스)

## 기능
- **팀 소개 페이지**: 각 팀원의 상세 정보를 제공하는 페이지로 이동
- **가로 슬라이드 이미지 뷰**: 팀원 사진을 가로로 스크롤하여 확인할 수 있음
- **탭 제스처**: 사진을 터치하면 해당 팀원의 상세 정보를 볼 수 있음
- **다양한 화면 전환**: 페이지 간 부드러운 전환을 제공
- **사용자 친화적인 UI**: 중앙 정렬된 텍스트와 직관적인 내비게이션

## 언어
- iOS
- Swift
- UIkit

## 설치 방법
1. **Xcode 설치**: 이 앱은 iOS 앱으로, [Xcode](https://developer.apple.com/xcode/)가 필요합니다.
2. **프로젝트 복제**: 다음 명령어를 사용하여 프로젝트를 복제합니다.
    ```bash
    git clone https://github.com/username/blip-inside.git
    ```
3. **프로젝트 열기**: 터미널에서 `cd blip-inside`로 이동한 후 `BlipInside.xcodeproj` 파일을 Xcode에서 엽니다.
4. **의존성 설치**: 프로젝트의 의존성이 있다면, `Podfile`을 실행하여 Cocoapods 의존성을 설치합니다.
    ```bash
    pod install
    ```
5. **시뮬레이터에서 실행**: Xcode에서 `Cmd + R`을 눌러 시뮬레이터에서 앱을 실행합니다.

## 사용법
1. **앱 실행**: 앱을 실행하면 로고와 함께 메인 화면이 나타납니다.
2. **팀원 소개**: 가로로 스크롤 가능한 팀원 사진들을 클릭하여 해당 팀원의 상세 정보를 확인할 수 있습니다.
3. **상세 정보 보기**: 상세 페이지에서는 팀원 정보(이름, 해시태그, TMI, 소셜 링크 등)를 확인할 수 있습니다.
4. **뒤로 가기**: 상단 로고를 클릭하여 메인 화면으로 돌아갈 수 있습니다.

## 주요 클래스 설명
- **MainContentViewController**: 가로 스크롤 가능한 팀원 사진 목록을 보여주는 메인 화면
- **DetailViewController**: 선택된 팀원의 상세 정보를 보여주는 화면
- **PageContentViewController**: 상세 정보에서 각각의 팀원 데이터를 제공하는 페이지 뷰 컨트롤러

## 스크린샷
![Main Screen](./screenshots/main_screen.png)
*Main Screen of Blip Inside*

![Detail Screen](./screenshots/detail_screen.png)
*Detail View with Team Member Information*

## 기여자
1. 김석준 - https://github.com/dnwn1211
2. 박진홍 - https://github.com/jbnong07
3. 양정무 - https://github.com/jeongmuya

## 라이선스
이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 [LICENSE](./LICENSE)를 참조하세요.
