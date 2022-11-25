# 주제

**주어진 테스트 API를 사용하여 소환사 메인 페이지를 볼 수 있는 어플리케이션 제작**

- 진행 프로그램: [제플린](https://app.zeplin.io/project/5e3d3fca05e791b334461f22)

- 필수 사항
  - 실행 가능하고, 크래시가 없는 프로젝트
  - **iOS** : Swift 5 사용, iOS 10.0 이상 지원
- 우대사항
  - **iOS:**
    - Autolayout 을 활용한 UI 구성
    - 오픈소스 사용
    - Custom View 활용
- 참고 사항

  본 과제는 동작하는 앱의 단순 구현이 목적이 아니라 평소 개발적인 능력과 습관을 파악하기 위함입니다. 본인이 생각하는 가장 깔끔하고 효율적인 구조의 코드를 작성해주세요.
  데이터가 없을 때, 애니메이션 등 명시되지 않은 부분은 자유롭게 결정하여 구현해주세요.

# TEST API 정보

## 소환사정보

https://codingtest.op.gg/api/summoner/genetory

## 사용필드

- summoner → name : 소환사이름
- summoner → level : 소환사레벨
- summoner → profileImageUrl : 소환사프로필이미지
- summoner → leagues → wins : 이긴 게임수
- summoner → leagues → losses : 진게임수
- summoner → leagues → tierRank → name : 게임타입
- summoner → leagues → tierRank → imageUrl : 티어이미지

## 게임정보

https://codingtest.op.gg/api/summoner/genetory/matches?lastMatch={createDate}

## 사용필드

- games → champion : 챔피언정보
- games → spells : 챔피언스펠
- games → items : 챔피언아이템
- games → createDate : 게임시작 시간
- games → gameType : 게임타입
- games → gameLength : 전체게임시간
- games → isWin : 승리/ 패배
- games → stats->general → kills : 킬수
- games → stats->general → deaths : 데스수
- games → stats->general → assists : 어시스트수
- games → stats->general → opScoreBadge : MVP,ACE 뱃지
- games → stats->general → contributionForKillRate : 킬 관여율
- games → champions : 사용한챔피언정보

Load more 구현시마지막게임createDate 로lastMatch 파라미터에 담아개발해주시면됩니다.

# 과제 안내

![iOS Screenshot](https://quilled-repair-dc6.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe293ea39-d139-40d2-815f-e11fff25f7cc%2F그림1.jpg?table=block&id=c3c7f24b-5728-47a4-8ac1-e0ab50d16408&spaceId=3f52bf85-e6be-400b-843d-0f36f8055e49&width=880&userId=&cache=v2)

1. 테스트API 를사용하여 데이터를 가져옵니다.
2. 전적갱신을터치하면다시데이터를 가져옵니다.
3. 티어가보여지는 화면은가로스크롤됩니다.
4. 5.9 / 5.8 / 14.1 : kills / assits / deaths
5. KDA 공식: (kills + assists) / deaths
6. 모스트승률은챔피언승률상위2개의챔피언으로구성됩니다.
7. Load more 기능을구현해주세요.
8. 무승부는 없습니다.

# ❗ FAQ

|                                                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------- |
| Q. 모스트 승률은 챔피언 승률 상위 2개의 챔피언으로 구성된다고 하였는데 챔피언 승률은 어느 필드의 값을 확인해야 하는 것인가요? |
| A: 게임정보 API → champions 의 필드들을 통해 구성하시면 됩니다.                                                               |
| Q. 최근 20게임 분석으로 인한 전적에서 소수점이 나올 수 있나요?                                                                |
| A: 사전과제 하단 5번에 KDA 공식 확인 부탁드리며, 소수점 2자리에 맞게만 처리해주시면 됩니다.                                   |
| Q. 시간 게임정보중 gameLength의 단위는 어떤것인가요?                                                                          |
| A: GameLength는 Unix timestamp(seconds)라고 생각해주시면 됩니다.                                                              |
