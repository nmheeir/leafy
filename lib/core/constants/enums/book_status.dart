// TODO: Đổi tên enum thành BookReadingStatus
enum BookStatus {
  finished, // Đã đọc (progress = 100)

  inProgress, // Đang đọc (progress > 0)

  forLater, // Để đọc sau

  unfinished, // Sách chưa được đọc (chưa tải hoặc progress = 0)
}

extension BookStatusExtension on BookStatus {
  int get value {
    switch (this) {
      case BookStatus.finished:
        return 0;
      case BookStatus.inProgress:
        return 1;
      case BookStatus.forLater:
        return 2;
      case BookStatus.unfinished:
        return 3;
    }
  }
}

BookStatus parseBookStatus(int value) {
  switch (value) {
    case 0:
      return BookStatus.finished;
    case 1:
      return BookStatus.inProgress;
    case 2:
      return BookStatus.forLater;
    case 3:
      return BookStatus.unfinished;
    default:
      return BookStatus.finished;
  }
}
