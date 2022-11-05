# MovieDiary

## 💻 기능구현방식 & 📱구현화면

## 리뷰 목록
<img width="290" alt="스크린샷 2022-10-22 오후 4 19 56" src="https://user-images.githubusercontent.com/98341623/199761120-5b246dc7-ea18-4b19-8223-e3f65e51920d.PNG">

### 1. TableView를 이용해 리뷰 목록을 보여줍니다.
리뷰 목록은 CoreData를 이용해 가져옵니다.
1. 영화제목
2. 영화정보
3. 리뷰작성시간

### 2. 원하는 목록을 선택하면 리뷰 Detail 페이지로 넘어갑니다.

## 리뷰 Detail
<img width="290" alt="스크린샷 2022-10-22 오후 4 19 56" src="https://user-images.githubusercontent.com/98341623/199761116-dbda4891-c278-4bcc-ae9a-fadbce174c44.PNG">

1. 작성한 리뷰 내용
2. 영화 평가

## 영화 검색
<img width="290" alt="스크린샷 2022-10-22 오후 4 19 56" src="https://user-images.githubusercontent.com/98341623/199761111-913cb500-7489-4814-97ca-f49bc458b006.PNG">

### 1. 영화 제목을 검색하면 URLSession을 이용해 BoxOfficeService에서 Networking 합니다.

### 2. TableView를 이용해 영화 목록을 보여줍니다.
1. 영화제목
2. 영화제목(EN)
3. 영화정보
4. 감독이름

### 3. 원하는 영화를 선택하면 리뷰 작성 페이지로 넘어갑니다.

## 리뷰 작성
<p>
<img width="290" alt="스크린샷 2022-10-22 오후 4 19 56" src="https://user-images.githubusercontent.com/98341623/199761057-be81c726-f4e0-41b3-8c77-e263a90f6b2a.PNG">

<img width="290" alt="스크린샷 2022-10-22 오후 4 19 56" src="https://user-images.githubusercontent.com/98341623/199761079-7e03f82b-6e83-436b-ac16-3bff32d2aca9.PNG">
</p>
- 리뷰와 평가를하고 등록을 누르면 다시 리뷰 목록 페이지로 돌아갑니다.

### 1. 리뷰는 ReviewManager를 통해 CoreData로 저장됩니다.

## BoxOffice
<img width="290" alt="스크린샷 2022-10-22 오후 4 19 56" src="https://user-images.githubusercontent.com/98341623/199761105-c1ed5fee-027d-42a1-b3b1-790ee4c2aba6.PNG">

### 1. TableView를 이용해 박스오피스 순위를 보여줍니다.
1. Poster Image
2. 영화 제목
3. 개봉일
4. 박스오피스 순위 & 랭킹에 신규 진입 여부
5. 전일대비 순위의 증감분
6. 누적 관객수


### 2. URLSession을 이용해 BoxOfficeService에서 Networking 합니다.
 1. 박스오피스 순위를 불러와 영화코드를 얻습니다.
 2. 영화코드를 이용해 영화 상세정보를 얻습니다.
 3. 영화이름을 이용해 영화 포스터 이미지를 얻습니다.


### 3. NSCache를 이용해 Poster Image를 캐싱합니다.

## Setting

### 1. 문의하기를 통해 개발자에게 문의 메일을 보낼 수 있습니다.
