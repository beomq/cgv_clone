class Movie {
  final int rank;
  final String rating;
  final String title;
  final String subTitle;
  final String imageUrl;
  final String runTime;

  Movie({
    required this.rank,
    required this.rating,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.runTime,
  });
}

List<Movie> movieList = [
  Movie(
    rank: 1,
    rating: '8.83',
    title: '아바타 물의 길',
    subTitle: '판도라의 바다, 세로운 세계가 펼쳐진다',
    imageUrl: 'assets/images/poster_01.jpeg',
    runTime: '3시간 12분',
  ),
  Movie(
    rank: 2,
    rating: '8.83',
    title: '듄',
    subTitle: '이것은 위대한 시작이다',
    imageUrl: 'assets/images/poster_02.jpeg',
    runTime: '2시간 35분',
  ),
  Movie(
    rank: 3,
    rating: '8.94',
    title: '엘리멘탈',
    subTitle: '올 여름, 엘리텐트 시티로 초대합니다',
    imageUrl: 'assets/images/poster_03.jpeg',
    runTime: '1시간 49분',
  ),
  Movie(
    rank: 4,
    rating: '9.40',
    title: '해리포터와 마법사의 돌',
    subTitle: '10월 24일 마법이 다시 시작된다',
    imageUrl: 'assets/images/poster_04.jpeg',
    runTime: '2시간 32분',
  ),
  Movie(
    rank: 5,
    rating: '8.57',
    title: '오펜하이머',
    subTitle: '23 8 15',
    imageUrl: 'assets/images/poster_05.jpeg',
    runTime: '3시간',
  ),
  Movie(
    rank: 1,
    rating: '9.84',
    title: '반지의 제왕 반지 원정대',
    subTitle: '1월 11일 전대반지가 다시 꺠어난다!',
    imageUrl: 'assets/images/poster_06.jpeg',
    runTime: '3시간 48분',
  ),
  Movie(
    rank: 7,
    rating: '9.40',
    title: '토이 스토리 3',
    subTitle: '이별은 없어! 우리는 반드시 함꼐 돌아가야 해',
    imageUrl: 'assets/images/poster_07.jpeg',
    runTime: '1시간 42분',
  ),
];
