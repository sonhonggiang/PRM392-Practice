import 'models.dart';

final List<Book> mockBooks = [
  Book(
    id: '1',
    title: 'Dế Mèn Phiêu Lưu Ký',
    author: 'Tô Hoài',
    description: 'Tác phẩm nổi tiếng nhất của nhà văn Tô Hoài về cuộc phiêu lưu của chú Dế Mèn.',
    coverUrl: 'https://via.placeholder.com/150',
    chapters: [
      Chapter(
        id: 'c1',
        title: 'Chương 1: Tôi sống độc lập từ thuở bé',
        content: 'Tôi sống độc lập từ thuở bé. Đấy là tục lệ của họ dế chúng tôi. Hễ con cái đã nhớn thì mẹ cho ra ở riêng...',
      ),
      Chapter(
        id: 'c2',
        title: 'Chương 2: Bài học đường đời đầu tiên',
        content: 'Hung hăng, hống hách láo chỉ tổ đem thân mà trả nợ cho những cử chỉ ngu dại của mình thôi. Tôi đã phải trải qua một bài học như thế...',
      ),
    ],
  ),
  Book(
    id: '2',
    title: 'Số Đỏ',
    author: 'Vũ Trọng Phụng',
    description: 'Một tác phẩm trào phúng kinh điển của văn học Việt Nam.',
    coverUrl: 'https://via.placeholder.com/150',
    chapters: [
      Chapter(
        id: 'c1',
        title: 'Chương 1: Xuân Tóc Đỏ xuất hiện',
        content: 'Cái xã hội này thật là kỳ lạ. Một kẻ như Xuân Tóc Đỏ lại có thể leo cao đến thế...',
      ),
      Chapter(
        id: 'c2',
        title: 'Chương 2: Cuộc đổi đời',
        content: 'Từ một kẻ nhặt banh quần vợt, Xuân đã bước chân vào giới thượng lưu nhờ những sự tình cờ trớ trêu...',
      ),
    ],
  ),
];
