List<int> denseRanking(
  List<int> scores,
  List<int> playerScores,
) {
  // Membuat list kosong untuk menyimpan peringkat hasil bagi setiap skor GITS.
  List<int> ranks = [];

  // Membuat peringkat untuk skor pemain lainnya
  List<int> denseRank = [];
  int currentRank = 1;

  for (int i = 0; i < scores.length; i++) {
    // // Peringkat hanya bertambah jika skor sekarang berbeda dengan skor sebelumnya
    if (i > 0 && scores[i] != scores[i - 1]) {
      denseRank.add(currentRank);
    } else {
      denseRank.add(currentRank - 1);
    }
    currentRank++;
  }

  // Menentukan peringkat untuk setiap skor pemain
  for (int score in playerScores) {
    int rank = 1;
    for (int i = 0; i < scores.length; i++) {
      if (score >= scores[i]) {
        break;
      }
      rank++;
    }
    ranks.add(rank);
  }

  return ranks;
}

void main() {
  // skor pemain yang sudah diurutkan dari yang terbesar ke terkecil
  List<int> scores = [100, 100, 50, 40, 40, 20, 10];

  // skor yang diperoleh pemain pada setiap pertandingan
  List<int> gitsScore = [5, 25, 50, 120];
  List<int> dadiScore = [10, 30, 50, 100];
  List<int> kevinScore = [10, 25, 40, 110];

  // Menghitung ranking masing-masing pemain
  List<int> resultGits = denseRanking(scores, gitsScore);
  List<int> resultDadi = denseRanking(scores, dadiScore);
  List<int> resultKevin = denseRanking(scores, kevinScore);

  // Menampilkan hasil ranking
  print('Ranking GITS: ${resultGits.join(", ")}');
  print('Ranking Dadi: ${resultDadi.join(", ")}');
  print('Ranking Kevin: ${resultKevin.join(", ")}');
}
