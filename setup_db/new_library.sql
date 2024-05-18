-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: mysql
-- Thời gian đã tạo: Th5 18, 2024 lúc 04:51 AM
-- Phiên bản máy phục vụ: 8.4.0
-- Phiên bản PHP: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `library`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(5, 'admin', 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `id` int NOT NULL,
  `author` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `author`, `description`) VALUES
(8, 'Trần Thời', 'tran-thoi'),
(9, 'William J. Bernstein', 'william-j-bernstein'),
(12, 'Vũ Hữu Tiệp', 'vu-huu-tiep'),
(13, 'Paulo Coelho', 'paulo-coelho'),
(14, 'Jeffrey E. Garten', 'jeffrey-e-garten'),
(15, 'Peter Lynch', 'peter-lynch'),
(16, 'Mario Puzo', 'mario-puzo'),
(17, 'William L. Shirer', 'william-l-shirer'),
(18, 'Olga Filipova', 'olga-filipova'),
(20, 'Robin Sharma', 'robin-sharma'),
(21, 'Nguyễn Cảnh Bình', 'nguyen-canh-binh'),
(22, 'Nguyễn Du', 'nguyen-du'),
(26, 'Hồ Chí Minh', 'ho-chi-minh'),
(27, 'Thạch Lam', 'thanh-lam'),
(29, 'Nguyễn Ngọc Tư', 'nguyen-ngoc-tu'),
(30, 'Vũ Bằng', 'vu-bang'),
(31, 'Vũ Trọng Phụng', 'vu-trong-phung'),
(32, 'Nguyễn Tuân', 'nguyen-tuan'),
(33, 'Nguyễn Công Hoan', 'nguyen-cong-hoan'),
(34, 'Nguyễn Huy Thiệp', 'nguyen-huy-thiep'),
(35, 'Nguyễn Bính', 'nguyen-binh'),
(36, 'Hồ Xuân Hương', 'ho-xuan-huong'),
(37, 'Phan Thế Roanh', 'phan-the-roanh'),
(38, 'Haruki Murakami', 'haruki-murakami');

--
-- Bẫy `authors`
--
DELIMITER $$
CREATE TRIGGER `xoatacgia` BEFORE DELETE ON `authors` FOR EACH ROW DELETE FROM `books` WHERE `author_id` = OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int NOT NULL,
  `cover_path` varchar(260) NOT NULL,
  `file_path` varchar(260) NOT NULL,
  `description` text,
  `published` date NOT NULL DEFAULT (curdate())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `title`, `author_id`, `category_id`, `cover_path`, `file_path`, `description`, `published`) VALUES
(7, 'Mật Thư', 8, 2, 'nhasachmienphi-mat-thu.png', 'nhasachmienphi-mat-thu.pdf', 'Mật thư do tác giả Trần Thời biên soạn sẽ giới thiệu đến bạn đọc 9 kiểu mật thư, từ những dạng đơn giản nhất như đọc ngược, đọc lái từ, bỏ đầu bỏ đuôi, đến dạng kí hiệu morse, dạng thay thế, đọc theo khóa, dạng tượng hình hay tọa độ… Sau mỗi phần giới thiệu, bạn sẽ nhanh chóng được thử sức cùng những mật thư nho nhỏ nữa đấy.', '2013-01-01'),
(8, 'Lịch Sử Giao Thương: Thương Mại Định Hình Thế Giới Như Thế Nào ?', 9, 4, 'nhasachmienphi-lich-su-giao-thuong-thuong-mai-dinh-hinh-the-gioi-nhu-the-nao.jpg', 'nhasachmienphi-lich-su-giao-thuong-thuong-mai-dinh-hinh-the-gioi-nhu-the-nao.pdf', '“Toàn cầu hóa” hóa ra không phải là một hay thậm chí là một chuỗi sự kiện; mà đó là tiến trình diễn ra chậm rãi trong một thời gian rất, rất dài. Thế giới không đột nhiên trở nên “phẳng” với phát kiến về Internet, và thương mại không bất ngờ bị các tập đoàn lớn tầm cỡ toàn cầu chi phối vào cuối thế kỷ 20. Khởi đầu bằng hàng hóa giá trị cao được ghi nhận trong lịch sử, sau đó từ từ mở rộng sang các mặt hàng ít quý giá hơn, cồng kềnh và dễ hư hỏng hơn, những thị trường của Cựu Thế giới dần tiến đến hợp nhất. Với hành trình đầu tiên của người châu Âu tới Tân Thế giới, quá trình hội nhập toàn cầu diễn ra ngàycàng mạnh mẽ. Hôm nay, các tàu container đồ sộ, máy bay phản lực, Internet, cùng mạng lưới cung ứng và sản xuất ngày càng được toàn cầu hóa chỉ là những bước tiến xa hơn của một quá trình đã diễn ra suốt 5.000 năm qua.', '2018-01-06'),
(12, 'Machine Learning Cơ Bản', 12, 6, 'nhasachmienphi-machine-learning-co-ban.jpg', 'nhasachmienphi-machine-learning-co-ban.pdf', 'Những năm gần đây, AI – Artificial Intelligence (Trí Tuệ Nhân Tạo), và cụ thể hơn là Machine Learning (Học Máy hoặc Máy Học) nổi lên như một bằng chứng của cuộc cách mạng công nghiệp lần thứ tư (1 – động cơ hơi nước, 2 – năng lượng điện, 3 – công nghệ thông tin). Trí Tuệ Nhân Tạo đang len lỏi vào mọi lĩnh vực trong đời sống mà có thể chúng ta không nhận ra. Xe tự hành của Google và Tesla, hệ thống tự tag khuôn mặt trong ảnh của Facebook, trợ lý ảo Siri của Apple, hệ thống gợi ý sản phẩm của Amazon, hệ thống gợi ý phim của Netflix, máy chơi cờ vây AlphaGo của Google DeepMind, …, chỉ là một vài trong vô vàn những ứng dụng của AI/Machine Learning.', '2020-02-01'),
(13, 'Nhà Giả Kim', 13, 7, '65f1c8a3ee3b5_1161.jpg', '65f1c8a3edfdb_2429.pdf', 'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.', '2002-01-01'),
(57, 'Từ Tơ Lụa Đến Slicicon', 14, 8, 'nhasachmienphi-tu-to-lua-den-silicon.jpg', 'nhasachmienphi-tu-to-lua-den-silicon.pdf', 'Đây là câu chuyện chưa từng kể về toàn cầu hóa. Nó xoay quanh mười nhân vật đã làm cho thế giới chúng ta nhỏ lại và gắn kết với nhau hơn. Trong số những người bạn sẽ gặp có một thiếu niên lớn lên từ thảo nguyên Trung Á để rồi dựng nên một đế quốc rộng lớn nhất trong lịch sử; có nhà sản xuất các sản phẩm bằng giấy trang trí đã đưa truyền thông toàn cầu đến những tiến bộ vượt xa mọi thành tựu trong lịch sử nhân loại; có nhà buôn (rượu) cognac đã nghĩ ra một thí nghiệm chưa từng ai dám làm để phá bỏ các biên giới các quốc gia; có một người tị nạn trốn chạy khỏi Đức Quốc xã lẫn Liên Xô để dẫn đầu một cuộc cách mạng máy tính; và nhiều người khác nữa với cuộc đời cũng lâm li tương tự. Thành tựu của họ không chỉ kịch tính trong thời đại họ sống mà còn đang tiếp tục định hình thế giới ngày nay của chúng ta. ', '2017-12-01'),
(58, 'Đánh Bại Phố Wall', 15, 8, 'nhasachmienphi-danh-bai-pho-wall.jpg', 'nhasachmienphi-danh-bai-pho-wall.pdf', 'Với 13 năm kinh nghiệm quản lý thành công quỹ đầu tư Fidelity Magellan và lựa chọn hàng nghìn cổ phiếu, Lynch đã đúc kết thành 21 nguyên tắc hài hước mà ông gọi là “Những nguyên tắc của Peter”.\r\n\r\nChìa khóa để đầu tư thành công, theo Lynch, là phải ghi nhớ rằng cổ phiếu không giống như tấm vé số; luôn có một công ty đằng sau mỗi cổ phiếu và một nguyên nhân lý giải cho cách thức vận hành của các công ty – và cổ phiếu của chúng. Lynch chỉ ra làm cách nào chúng ta có thể tìm hiểu tối đa về công ty mục tiêu và xây dựng một danh mục đầu tư sinh lợi dựa trên chính kinh nghiệm, hiểu biết và kết quả nghiên cứu của bản thân. Không có bất kỳ lý do nào cản trở một nhà đầu tư cá nhân tự trở thành chuyên gia, và cuốn sách này sẽ chỉ ra cách thực hiện điều đó.', '2010-01-01'),
(59, 'Bố Già', 16, 1, 'nhasachmienphi-bo-gia.jpg', 'bo-gia.pdf', 'Bố già là tên một cuốn tiểu thuyết nổi tiếng của nhà văn người Mỹ gốc Ý Mario Puzo, được nhà xuất bản G. P. Putnam\'s Sons xuất bản lần đầu vào năm 1969. Tác phẩm là câu chuyện về một gia đình mafia gốc Sicilia tại Mỹ, được một nhân vật gọi là \"Bố già\" Don Vito Corleone tạo lập và lãnh đạo.', '1969-10-03'),
(61, ' Sự Trỗi Dậy Và Suy Tàn Của Đế Chế Thứ Ba – Lịch Sử Đức Quốc Xã', 17, 9, '65f71ed025a90_5026.jpg', 'nhasachmienphi-su-troi-day-va-suy-tan-cua-de-che-thu-ba-lich-su-duc-quoc-xa.pdf', 'Ngay trong năm đầu tiên phát hành – 1960, Sự trỗi dậy và suy tàn của Đế chế thứ ba đã bán được tới 1 triệu bản tại Mỹ và được tái bản hơn 20 lần. Cuốn sách là bản tường thuật hết sức chi tiết về nước Đức, dưới sự cai trị của Adolf Hitler và Đảng Quốc xã. Tác giả đã nghiên cứu kĩ lưỡng về sự ra đời của Đế chế thứ ba ở Đức, con đường dẫn đến quyền lực tuyệt đối của Đảng Quốc xã, diễn biến của Chiến tranh thế giới lần thứ hai và sự thất bại của Phát xít Đức. Nguồn tài liệu của cuốn sách bao gồm lời khai của các nhà lãnh đạo Đảng Quốc xã, nhật kí của các quan chức, cùng hàng loạt các quân lệnh và thư mật.', '1960-11-10'),
(62, 'Đời Ngắn Đừng Ngủ Dài', 20, 3, 'nhasachmienphi-doi-ngan-dung-ngu-dai.png', 'nhasachmienphi-doi-ngan-dung-ngu-dai.pdf', '“Mọi lựa chọn đều giá trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo cách của nó, không phải theo cách của ta. Hãy kiên nhẫn. Tin tưởng. Hãy giống như người thợ cắt đá, đều đặn từng nhịp, ngày qua ngày. Cuối cùng, một nhát cắt duy nhất sẽ phá vỡ tảng đá và lộ ra viên kim cương. Người tràn đầy nhiệt huyết và tận tâm với việc mình làm không bao giờ bị chối bỏ. Sự thật là thế.”', '2014-01-05'),
(63, 'Hiến Pháp Mỹ Được Làm Ra Như Thế Nào?', 21, 9, '65f24db234ea2_1396.jpg', '65f24db2346b1_3559.pdf', 'Cuốn sách đã cung cấp một bức tranh toàn cảnh về sự ra đời của Hiến pháp Mỹ, như một lời lý giải cho rất nhiều người có cùng mối băn khoăn.Vậy Hiến pháp Mỹ đã được làm ra như thế nào? Nó được làm ra trong những cuộc tranh luận nảy lửa tưởng như không có lối thoát và những mối bất đồng sâu sắc, bởi những bộ óc vĩ đại có một không hai trong lịch sử, và bằng một tinh thần mà người ta khó có thể tìm một tính từ nào thay thế ngoài cách gọi – “tinh thần Mỹ”. Đó là sự tôn trọng đặc biệt lẫn nhau, thừa nhận những quan điểm hoàn toàn khác biệt, chấp nhận và cùng thỏa hiệp để đi tới lợi ích chung cuối cùng.', '2002-01-12'),
(72, 'Thương Nhớ Mười Hai', 30, 46, '6623391ce828c_3546.jpg', '6623391ce71ca_9869.pdf', 'Trong số tác phẩm của Vũ Bằng, Thương Nhớ Mười Hai là tác phẩm đặc sắc nhất, tiêu biểu cho tình cảm và phong cách viết của ông. Tác phẩm được đặt bút từ Tháng Giêng 1960 và mất mười một năm mới hoàn thành vào năm 1971 với độ dày 250 trang.\r\n\r\nMười hai ở đây là mười hai tháng trong năm mà theo lời tác giả “mỗi tháng lại có những cái đẹp não nùng riêng, nỗi nhớ nhung riêng…”. Thông qua mười hai tháng ấy, Vũ Bằng đã gởi gắm những hồi ức đẹp đẽ của mình về Hà Nội, nơi chốn xa xôi ông luôn hướng về với những phong tục của người Bắc Việt, những thói quen sinh hoạt, những thú vui ẩm thực giản dị mà đầy tính nghệ thuật và trên tất cả là hình bóng người vợ đảm đang dịu hiền đang còn xa cách…\r\n\r\nNhân vật tôi ở miền Nam mà lòng luôn nhớ thương miền Bắc. Nỗi lòng ấy da diết và khắc khoải tựa thanh gỗ mục, bề ngoài đẹp đẽ mà bên trong đã rệu nát tự bao giờ. Ông biết thế là bất công nhưng tình yêu mà, đã yêu thì bao giờ người mình yêu cũng là đẹp nhất. Ông còn thầm cảm ơn sự bất công ấy bởi nó đã cho ông nhận ra mình yêu Bắc Việt đến dường nào…mà càng yêu thì lại càng nhớ…\r\n\r\nMời các bạn đón đọc Thương Nhớ Mười Hai của tác giả Vũ Bằng.', '1972-01-01'),
(73, 'Hồ Xuân Hương thơ và đời', 36, 43, '66233a285db29_2486.jpg', '66233a285d264_1376.pdf', 'Thiên tài, kỳ nữ, hay nói giản dị hơn: Danh tài độc đáo Hồ Xuân Hương, tên tuổi kỳ diệu ấy vượt qua mọi cuộc tranh luận xưa nay, tự mình sừng sững chiếm vị trí đặc biệt trong làng thơ Việt Nam với một di sản tinh thần tuy còn được lưu truyền không nhiều: bên cạnh tập Lưu hương ký mà từ khi được phát hiện, chưa mấy ai phủ định, nhưng mọi người hầu như vẫn dè dặt khi sử dụng tập thơ này (1), là dăm chục bài thơ tám câu bảy chữ hoặc bốn câu bảy chữ có một phong cách không trộn lẫn với ai, tuy còn một số bài vẫn ở dạng “tồn nghi”.\r\n\r\nVới Dương Quảng Hàm, thì đó là nữ sĩ có thiên tài và giàu tình cảm, nhưng “vì số phận hẩm hiu, thân thế long đong, nên trong thơ bà hoặc có ý lẳng lơ, hoặc có giọng mỉa mai, nhưng bài nào cũng chứa chan tình tự”. Ông khẳng định Hồ Xuân Hương là một nhà viết thơ Nôm thuần túy, thoát hẳn ảnh hưởng của thơ văn chữ Hán, với cách tả tình, tả cảnh, dùng ngữ hiệp vần rất khéo. Thời ấy, người ta còn chưa phát hiện ra Lưu hương ký.\r\n\r\nCòn Xuân Diệu thì gọi thẳng bà là Nhà thơ dòng Việt, là Bà chúa thơ Nôm, kể về độc đáo thì đứng vào bậc nhất trong văn học Việt Nam, mà lại hai lần độc đáo, vì đó là một phụ nữ đã dám “Ví đây đổi phận làm trai được”, và Xuân Diệu cho rằng thực sự nàng đã làm trai rồi, ngay trong chế độ cũ. Thơ của người dám làm trai ấy lại hết sức phụ nữ, người đàn bà ấy đã cất tiếng lên thì đố ai đã nghe một lần lại có thể quên được, quên nổi: “Thứ thơ ấy không chịu ở trong khuôn khổ thông thường, một thứ thơ muốn lặn sâu vào sự vật, vào những đáy rất kín thẳm của tâm tư, những đáy kín thẳm ấy không phải lạc lõng, cô đơn, cá nhân chủ nghĩa, mà trái lại, đã được hàng vạn, hàng vạn người đồng tình thông cảm”.\r\n\r\nBản thân là người có bản lĩnh tự tin mạnh mẽ, Hồ Xuân Hương chế diễu, đả kích cả một xã hội phong kiến với giọng đường hoàng, dõng dạc, chủ động và rất “đàn chị”. Thơ ấy, người ấy đập thẳng vào mặt bọn vua quan, nho lại, sư mô, trượng phu, quân tử dỏm, coi thường bọn mày râu không có khí chất đàn ông, không có phẩm cách nam nhi, kéo cái mặt nạ giả dối đủ kiểu, lôi tuột nó để làm trơ cái mặt thớt ấy ra trước thanh thiên bạch nhật, trước dư luận người đời. Thơ ấy, người ấy cất tiếng nói phản kháng quyết liệt của bản năng bị dồn ép vì những luân lý, lễ giáo, những thói thường ích kỷ. Sự phản ứng quyết liệt ấy nhiều khi cường điệu, thâm xưng, ám ti… một cách nghệ thuật, nên thường cũng hay bị người gán ghép cho những chuyện sinh lý có lúc quá trớn, quá đà. Đạt sự bình quyền, bình đẳng giữa nam và nữ, thơ ấy, người ấy không một chút ngại ngùng tố cáo triệt để sự bất công của xã hội trên nhiều lĩnh vực trong đó có hôn nhân và gia đình, đào sâu vào thân phận của người phụ nữ đa đoan nhưng cũng đa tình.\r\n\r\nNgười phụ nữ trở thành nhân vật trung tâm trong thơ Hồ Xuân Hương, có khi xuất đầu lộ diện, có khi giấu mặt. Nếu như Vichto Huygô có lý khi cho rằng: “Người ta có một tôn giáo thứ hai là tình yêu, và Chúa của đạo ấy chính là người phụ nữ”, thì phải chăng Hồ Xuân Hương không có lý với những bài thơ đề cao người đàn bà, tất cả những “cái gì thuộc về con người đối với tôi đều quý” như câu tục ngữ cổ mà Các Mác rất thích đó, cả chuyện trong buồng kín, phòng the, cả chuyện cơ thể của đàn bà – biểu tượng của cái đẹp?.\r\n\r\nCái đẹp thân thể và sự dâm đãng, nghệ thuật hướng về cái đẹp và nghệ thuật khiêu dâm. Đấy là những khoảng cách, những cực của hai quan điểm thẩm mỹ đối nghịch.\r\n\r\nĐẹp hay dâm tục câu thơ của Hồ Xuân Hương:\r\nĐôi gò Bồng Đảo hương còn ngậm\r\nMột lạch Đào Nguyên suối chửa thông.\r\n\r\n\r\nNhưng quả là trong thực tế, khi thẩm định thơ Hồ Xuân Hương, dễ có khuynh hướng gán ghép chuyện sinh lý có khi quá trớn; cũng không phải không ít người còn “táy máy” nghĩ đến cái nghĩa thứ hai trần tục, nó cứ đập vào giác quan người ta gây nên sự khó chịu vì tính chất hai mặt của biểu tượng. Cả trong trường hợp ấy nữa, thơ Hồ Xuân Hương đích thực cũng không thể bị coi là loại sáng tác khiêu dâm hay tục tĩu, nếu như người đọc hiểu rõ dụng ý của “vũ khí” mà nhà thơ đang sử dụng vào mục đích gì, nếu như người đọc gạt bỏ ra ngoài sự liên tưởng gán ghép cố tình, hoặc lẫn lộn thơ Hồ Xuân Hương đích thực với thơ được sáng tác theo phong cách Hồ Xuân Hương. Sự lẫn lộn ấy cũng không mấy dễ tìm ra cho rạch ròi, thuyết phục.\r\n\r\nNguyễn Lộc đã có lần đề cập tới cái khao khát của nhà thơ Hồ Xuân Hương về mặt tình yêu vật chất, tình yêu thể xác. Và ông xác đáng khi cho rằng, đừng vội nghĩ nói đến tình yêu thể xác, nói đến chuyện trong buồng kín của vợ chồng là dâm đãng. Nghệ thuật quyết định chủ yếu không phải ở đề tài. Ông viết: “Nhu cầu về cuộc sống bản năng cũng là một nhu cầu chân chính của con người, xã hội phong kiến phủ nhận, nên con người mới phản ứng chống lại. Ở Hồ Xuân Hương có cái gì quá đà, nhưng đặt trong bối cảnh của xã hội phong kiến phương Đông chịu ảnh hưởng nặng nề của Nho giáo, thì chính đó lại là một sự chống trả quyết liệt. Hồ Xuân Hương nói nhiều đến dục vọng thể xác, nhưng bà thể hiện những dục vọng ấy một cách lành mạnh và khỏe khoắn. Đọc thơ Hồ Xuân Hương, người ta thấy nhà thơ bao giờ cũng tỉnh táo, bà đứng cao hơn hiện tượng mình miêu tả; và với một tâm hồn nghệ sĩ thực sự, nhà thơ bao giờ cũng phát hiện được những khía cạnh thẩm mỹ trong đối tượng miêu tả của mình”. Về phương diện này, chúng tôi đồng tình với ông Nguyễn Lộc.\r\n\r\nHướng tuyển chọn thơ Hồ Xuân Hương trong tập sách này, phối hợp nhiều cách chọn để tìm một phương án khả dĩ chấp nhận được. Phần lớn các bài trong Lưu hương ký đều được tuyển chọn dựa vào sách của Đào Thái Tôn, có tham khảo các sách khác.\r\n\r\nGiới thiệu thơ Hồ Xuân Hương với bạn đọc rộng rãi lần này, chúng tôi muốn một lần nữa khẳng định Hồ Xuân Hương “một nhà thơ kiệt xuất, một tài năng văn học độc đáo” (Lịch sử Việt Nam, tập I, UBKHXHVN, 1970), độc đáo có một không hai trong lịch sử văn học Việt Nam. Bà không chỉ được đánh giá cao ở trong nước. Chính sự đánh giá cao của nhiều người nước ngoài càng làm chúng ta thêm tự tin. R. Tago trước kia, và gần đây, nhà thơ Pháp có tên tuổi ở Châu Âu – Jăng Rixtal – trong bài Tựa bản dịch thơ Hồ Xuân Hương sang tiếng Pháp, đã coi Hồ Xuân Hương là “một trong những tên tuổi lớn của văn học Việt Nam và không chút nghi ngờ, là một trong những nữ sĩ hàng đầu của Châu Á”.\r\n\r\nTác phẩm của Bà quả là có sức lay động mạnh mẽ.\r\n\r\nMọi cuộc tranh luận về Đời Hồ Xuân Hương và Thơ Hồ Xuân Hương sẽ còn tiếp tục. Những phát hiện. tìm tòi mới về tiểu sử thân thế, thời đại, tác phẩm của bà cùng với bao nhiêu vấn đề tranh luận khác xung quanh hiện tượng xã hội văn học dân tộc độc đáo này sẽ còn tiếp tục, mãi còn tiếp tục.\r\n\r\nNhưng... Giờ đây quyển sách đã tới tay bạn đọc, quyền bình giá thuộc về những người say mê, mến mộ bà. Mong rằng những ý kiến đa dạng, phong phú khác nhau về tác giả và tác phẩm Hồ Xuân Hương, về Thơ và Đời của bà, được chọn lựa giới thiệu trong tập này sẽ không cản trở người đọc trong cuộc thâm nhập thế giới thơ của Bà mà quyển sách này chỉ là một cách trình bày không khỏi còn khiếm khuyết. Trong khi biên soạn, người tuyển chọn đã tham khảo nhiều công trình đi trước của các tác giả Hoàng Xuân Hãn, Trần Thanh Mại, Nguyễn Lộc, Đào Thái Tôn, Nguyễn Bỉnh Khôi; các tác giả tập thơ Hồ Xuân Hương của đồng nghiệp Vĩnh Phú và của Nhà xuất bản Văn học mới ấn hành gần đây, cùng nhiều người khác.\r\n\r\nTrân trọng giới thiệu cùng bạn đọc và cảm ơn các tác giả !.\r\n \r\n\r\nLỮ HUY NGUYÊN', '2024-04-24'),
(74, 'Thạch Lam Tuyển Tập', 27, 42, '66233b2cbe77f_5029.jpg', '66233b2cbe5c7_4087.pdf', 'Thạch Lam sinh ngày 7-7-1910, tại ấp Thái Hà, Hà Nội, tên thật là Nguyễn Tường Vinh.\r\n\r\nNǎm 1932, ông tham gia ban biên tập tuần báo \"Phong hoá\", sau đó tham gia thành lập tổ chức \"Tự lực vǎn đoàn\", nhưng khác với Nhất Linh, Khái Hưng, Hoàng Đạo, ông có khuynh hướng tiến gần tới chủ nghĩa hiện thực và tình cảm nghiêng hoàn toàn vể người nghèo khổ, thông cảm chân thành với các cảnh ngộ éo le. Nhiều sáng tác của Thạch Lam có xu hướng tiến bộ tiêu biểu cho vǎn xuôi lãng mạn trong thời kỳ mặt trận dân chủ...\r\n\r\nCác tác phẩm chính: \"Gió đầu mùa\" (Tập truyện ngắn, 1937); \"Nắng trong vườn\" (Tập truyện ngắn, 1938); \"Ngày mới\" (Truyện dài, 1939); \"Theo dòng\" (Bình luận văn học, 1941); \"Sợi tóc\" (Tập truyện ngắn, 1942); \"Hà Nội băm sáu phố phường\" (Bút ký, 1943) và một số truyện ngắn thiếu nhi khác.\r\n***\r\nThạch Lam Tuyển Tập gồm có:\r\nI Truyện ngắn\r\nĐứa con đầu lòng\r\nNhà mẹ Lê\r\nTrở về\r\nMột cơn giận\r\nTiếng chim kêu\r\nNgười bạn trẻ\r\nCái chân què\r\nĐói\r\nMột đời người\r\nNgười lính cũ\r\nNgười bạn cũ\r\nHai lần chết\r\nGió lạnh đầu mùa\r\nNhững ngày mới\r\nDuyên số\r\nCô áo lụa hồng\r\nBắt đầu\r\nNgười đầm\r\nHai đứa trẻ\r\nĐứa con\r\nTrong bóng tối buổi chiều\r\nCuốn sách bỏ quên\r\nDưới bóng hoàng lan\r\nTối ba mươi\r\nCô hàng xén\r\nTình xưa\r\nSợi tóc\r\nII Tiểu thuyết\r\nNgày mới\r\nIII Ký sự Hà Nội băm sáu phố phường\r\nNhững biển hàng\r\nNgười Ta Viết Chữ Tây\r\nHàng Mứt, hàng Đường, hàng Muối trắng tinh\r\nQuà Hà Nội\r\nVẫn quà Hà Nội\r\nPhụ thêm vào phở\r\nBổ khuyết\r\nBún sườn và canh bún\r\n“Mìn páo” và “giầy giò”\r\nCòn quà Hà Nội\r\nNhững thứ “chuyên môn”\r\nBánh đậu\r\nBánh khảo, kẹo lạc\r\nMột thứ quà của lúa non: Cốm\r\nQuà ... tức là Người\r\nVài thứ chuyên môn nữa\r\nNhững chốn ăn chơi\r\nChợ mát ban đêm\r\nBà cụ bán xôi\r\nHàng nước cô Dần\r\nCác hiệu cao lâu Khách\r\nIV Tiểu luận phê bình\r\nTheo dòng\r\nMời các bạn đón đọc Thạch Lam Tuyển Tập của tác giả Thạch Lam.', '2024-04-26'),
(75, 'Điển Cố Truyện Và Thơ', 37, 43, '66233be767e61_5924.jpg', '66233be7676ee_6685.pdf', 'Thơ-văn của ta ngày trước, cũng như của Tàu, có nhiều đặc-tính : ý-tứ dồi dào tuy lời văn thưa-thớt, điều nhận-xét được chứng-dẫn phân-minh, câu nhạt-nhẽo thì tô nên vẻ đặm-đà, mà chiều thô-lậu cũng đổi ra màu thanh-nhã.\r\n\r\nĐó là kết-quả của một phương-pháp đặc-biệt : tác-giả thường nhắc tới thơ-văn cũ hoặc sự-tích xưa. Thơ-văn ấy, sự tích kia, gọi là ĐIỂN-CỐ, mà phép làm văn như thế, gọi là DỤNG ĐIỂN.\r\n\r\nCho nên muốn hiểu thấy thơ-văn cổ nước nhà, tất ta phải biết điển.\r\n\r\nGần đây, đã có những lời chú-thích ghi-chép ngay trong nhiều tập thơ-văn, hoặc biên-soạn thành mấy quyển từ-điển rất quí. Nhưng chúng tôi còn mong có thêm một BỘ ĐIỂN-CỐ CHÍNH CỔ-NHÂN BIÊN-CHÉP, vừa kỹ vừa vui, dễ lôi-cuốn cả những người không hay để ý đến thơ-văn cổ.\r\n\r\nMuốn đạt được mục-đích ấy, chúng tôi trộm nghĩ : phải góp-nhặt những truyện ngắn ly-kỳ với thơ-từ tuyệt-tác, trong sách chữ Hán, mà nhà văn của ta hay dùng làm điển, đem dịch ra nôm, câu truyện không thêm-bớt, thơ-từ theo nguyên điệu ; những truyện ngắn ấy thường là bài chép sẵn-sàng, lấy được nguyên-vẹn, nhưng có khi là nhiều đoạn rải-rác trích ra rồi ghép lại với nhau. Vả trên đầu mỗi truyện, có in những câu văn hay của nhiều tác-giả đã dùng truyện ấy làm điển.\r\n\r\nNhư vậy, nhà sưu-tầm có thể thấy được những chi-tiết khá đầy-đủ, và so-sánh được những cách dùng điển của nhiều tác-giả khác nhau ; người giải-trí ham đọc truyện lạ thơ hay, nhớ được dễ-dàng, rồi dần-dần có thêm kiến-thức để hiểu thơ-văn cổ, mà không ngờ rằng khi giải-trí kia, chính là khi học-tập.\r\n\r\nQuan-niệm về một bộ Điển-cố như vậy, vào hồi 1941, chúng tôi có trình với gia-tiên-nghiêm, tác-giả Bút-hoa thi-thảo, để xin thực-hiện ngay. Nhưng sự phiên-dịch mới bắt đầu, thì dịch-giả phút đà tạ-thế.\r\n\r\nSau, chúng tôi đã góp sức với mấy nhà ưa-chuộng thơ-văn cổ để tiếp-tục công-việc : vừa xong được 80 điển theo thứ-tự A B C, thì cuộc chiến-tranh làm cho phải bỏ dở, mà bản-thảo cũng bị thất-lạc.\r\n\r\nNay chúng tôi lại theo đường-lối cũ để thu-thập tài-liệu. Được đến đâu, in ra đến đấy thành tập nhỏ, chờ khi trọn bộ mới lập thành mục-lục tổng-quát theo thứ-tự A B C.\r\n\r\nVậy những bài sau đây, của nhiều dịch-giả, sẽ không xếp theo mục-loại nào, chỉ cốt cho dài-ngắn xen nhau, lỗi văn thay-đổi, để các bạn thấy vui mà ham đọc.\r\n\r\nHà-nội, tháng Mạnh-đông, năm Quí-tị 1953\r\n\r\nPHAN-THẾ-ROANH\r\n\r\nMời các bạn đón đọc Điển Cố Truyện Và Thơ của tác giả Phan Thế Roanh.', '1964-05-03'),
(76, 'Phía Nam biên giới, phía Tây mặt trời', 38, 7, '66233cae5bd27_5768.jpg', '66233cae5bba3_6255.pdf', 'Đó là câu chuyện đau đớn, khuấy động một cách ám ảnh. Một cuốn sách đẹp, gần như là mịn màng về những tầng sâu không thể dò đến của chúng ta.\r\nNgay từ nhỏ, cậu bé Hajime đã nhận thức sự bối rối và mặc cảm thân phận \"con một\", chẳng giống những đứa bạn cùng trang lứa. Và sau này, người bạn gái thân nhất của Hajime, Shimamoto-san cũng thuộc diện \"con một\" hiếm hoi. Đến người con gái mà Hajime lao vào với niềm đam mê khoái lạc không thể kiểm soát được, cũng là \"con một\"... Khuấy động ngay từ đầu câu chuyện là một chàng trai quá nhạy cảm với xung quanh như thế.\r\nNăm 37 tuổi, Hajime đã có một cơ ngơi đáng để anh mỉm cười hài lòng, một công việc vừa kiếm ra tiền, vừa thỏa mãn sở thích cá nhân, một người vợ xinh đẹp mà anh hết lòng yêu mến, hai đứa con thơ lúc nào cũng quấn quít chân bố. Cũng như nhiều đàn ông khác ở lứa tuổi này, Hajime cũng có tình nhân, nhưng chỉ là thoáng qua mà không đọng lại chút dư vị nào.\r\nVà Hajime đã yêu, yêu một người chỉ duy nhất có cái tên và tình bạn thời quá khứ hơn 20 năm. Khó mà lý giải điều gì đã khiến một người đàn ông đầy chuẩn mực với gia đình và công việc như Hajime đã lần lượt cởi trói những gì đang bó buộc mình. Phải chăng đó là sự mong manh giữa một người phụ nữ quá mơ hồ đến cùng những lời hẹn \"có lẽ\", \"có thể\", \"một khoảng thời gian nữa\"? Phải chăng anh yêu cô như muốn tìm lại quá khứ của chính mình? Phải chăng anh đang muốn kiếm tìm lời lý giải về ranh giới giữa thực và hư?\r\nRốt cuộc thì bao sốt ruột chờ trông mong mỏi của Hajime cũng được đền bù thoả đáng khi họ cùng trốn gia đình để đến với nhau, bất chấp chuyện gì xảy ra. Rốt cuộc thì cả hai lần đầu tiên được yêu nhau như người đàn ông yêu một người đàn bà. Rốt cuộc thì cả hai đã tìm ra sự hòa hợp hoàn hảo của cơ thể... Nhưng ngay cả ở chốn tưởng như đã là tận cùng đó, họ vẫn không thể đến được với nhau.\r\n \r\nKhông phải Hajime mà tất cả những người phụ nữ trong cuốn sách này đều bọc mình trong lớp màn bí ẩn. Đằng sau tình yêu trong veo của cô gái Izumi là một mối hận khiến cô trở thành vô cảm. Đằng sau cô vợ Yukiko ngọt ngào và xinh đẹp là một lần tự tử hụt cùng những nỗi đau dẳng dai bên mình. Còn đằng sau Shimamoto-san là một thứ gì mà không ai có thể chạm tới được...\r\nCó những gì?” có lẽ là câu hỏi mà cuốn sách nhỏ của Haruki Murakami đặt ra. Có những gì ở phía Nam biên giới, khi đó không chỉ là nước Mêxicô; có những gì ở phía Tây mặt trời, khi đó không chỉ là một chứng bệnh của những người nông dân Xibêri sống trong cảnh ngày đêm không phân cách; và có những gì trong những diễn tiến cuộc đời mỗi con người? Không chỉ cuộc đời ít chi tiết của Shimamoto-san mới gây băn khoăn, mà ngay cả ba giai đoạn được miêu tả hết sức rõ ràng của cuộc đời Hajime cũng không hoàn toàn làm thỏa mãn những người quen với những văn chương được tác giả chú tâm giải thích kỹ càng. Phía Nam biên giới, phía Tây mặt trời không yêu cầu người đọc diễn giải. Rất nhiều chi tiết trong đó thuộc về “tiểu sử ngoài đời” của Murakami, nhưng câu chuyện đơn giản được kể trên nền nhạc của Nat King Cole và Duke Ellington, với hương vị lạ lùng của những ly cocktail Daiquiri và Robin’s Nest có một khả năng đặc biệt: nó không cho phép mọi cách giải thích dễ dãi. Những câu hỏi liên tiếp hiện ra trong tâm trí Hajime, về ý nghĩa cuộc đời cũng như của từng trải nghiệm dù nhỏ đến đâu, sẽ dần truyền sang người đọc, và đến khi kết thúc, rất có thể sự hoang mang về ranh giới giữa thực và hư, chân thành và giả tạo, quy tắc và ngoại lệ sẽ là điều duy nhất mà người đọc “gặt hái” được. Điều này cũng không thật sự lạ, vì, đã trở thành quy luật, những câu trả lời thì qua đi, còn câu hỏi thì ở lại.\r\nPhía Nam biên giới, phía Tây mặt trời là cuốn tiểu thuyết chứa đựng nhiều nhất con người thật của Haruki Murakami, và là câu chuyện đơn giản nhất mà Murakami từng kể. Tuy vậy, đơn giản không có nghĩa là dễ hiểu, và một lối kể chuyện giản dị không loại bỏ những nỗ lực kín đáo trong việc thoát ra khỏi những lối đi văn chương đã cũ mòn.\r\n \r\n\"Sự kết nối\" dễ thấy giữa Phía Nam biên giới, phía Tây mặt trời và những tác phẩm khác của Murakami có lẽ là năng lực đặc biệt của nhà văn Nhật Bản đối với cách tạo ra và xử lý cái bí ẩn. Không có mật độ dày đặc như trong  Biên niên ký chim vặn dây cót hay Kafka bên bờ biển, cái bí ẩn ở đây giống như những đoạn nhạc jazz biến tấu ngẫu hứng trên nền của những bản nhạc cũ, và chính là cái để lại dư vị lâu nhất cho người đọc.', '2015-01-19'),
(77, 'Tắt Lửa Lòng', 33, 17, '66233d2e22495_2087.jpg', '66233d2e22141_9240.pdf', 'Tắt lửa lòng là một tiểu thuyết tình cảm lãng mạn của nhà văn Nguyễn Công Hoan, giới thiệu lần đầu tiên năm 1933. Tác phẩm này nhanh chóng trở nên phổ biến, và rất nhiều người chuyển thể thành vở kịch, bản nhạc khác nhau.\r\n\r\nSoạn giả Trần Hữu Trang đã biên kịch lại và chuyển thể lại thành vở cải lương \"Lan và Điệp\" năm 1936. Và cái tên \"Lan và Điệp\" trở thành huyền thoại từ đó, thậm chí nó còn nổi tiếng hơn cả tên tác phẩm Tắt lửa lòng.\r\n\r\n***\r\nNguyễn Công Hoan quê ở làng Xuân Cầu, tổng Xuân Cầu, huyện Văn Giang, phủ Thuận Thành, tỉnh Bắc Ninh (nay thuộc xã Nghĩa Trụ, huyện Văn Giang, tỉnh Hưng Yên). Ông sinh trong một gia đình quan lại xuất thân Nho học thất thế. Trong gia đình, từ nhỏ Nguyễn Công Hoan đã được nghe và thuộc rất nhiều câu thơ, câu đối và những giai thoại có tính chất trào lộng, châm biếm, đả kích tầng lớp quan lại. Điều đó ảnh hưởng mạnh mẽ đến phong cách văn chương của ông sau này. Ông có ba người em trai đều tham gia hoạt động cách mạng và giữ cương vị quan trọng là Nguyễn Công Miều (Lê Văn Lương) Ủy viên Bộ Chính trị, Nguyễn Công Bồng nguyên Phó Tổng Giám đốc Nha Công an và Nguyễn Công Mỹ nguyên Tổng Giám đốc đầu tiên của Nha bình dân học vụ.\r\n\r\nNăm 1926, ông tốt nghiệp cao đẳng sư phạm, làm nghề dạy học ở nhiều nơi (như Hải Dương, Lào Cai, Nam Định,…) cho đến khi Cách mạng tháng Tám nổ ra. Nguyễn Công Hoan viết văn từ sớm, tác phẩm đầu tay Kiếp hồng nhan (viết năm 1920, được Tản Đà thư điếm xuất bản năm 1923) là một đóng góp cho nền văn xuôi Việt Nam bằng chữ Quốc ngữ.\r\n\r\nSau Cách mạng tháng Tám, ông giữ chức Giám đốc kiểm duyệt báo chí Bắc Bộ, kiêm Giám đốc Sở Tuyên truyền Bắc Bộ. Sau đó ông gia nhập Vệ quốc quân, làm biên tập viên báo Vệ quốc quân, giám đốc trường Văn hóa quân nhân, chủ nhiệm và biên tập tờ Quân nhân học báo. Ông là đảng viên Đảng Lao động Việt Nam từ năm 1948. Năm 1951 ông làm việc ở Trại tu thư của ngành giáo dục, biên soạn sách giáo khoa và sách Sử Việt Nam hiện đại từ Pháp thuộc đến năm 1950 dùng cho lớp 7 hệ 9 năm. Ông cũng viết bài cho báo Giáo dục nhân dân, cơ quan ngôn luận đầu tiên của Bộ Quốc gia giáo dục lúc bấy giờ. Từ sau năm 1954, ông trở lại nghề văn với cương vị Chủ tịch Hội nhà văn Việt Nam (khóa đầu tiên 1957-1958), ủy viên Ban Thường vụ trong Ban Chấp hành Hội nhà văn Việt Nam các khóa sau đó. Ông cũng là ủy viên Ban chấp hành Hội liên hiệp Văn học nghệ thuật Việt Nam, chủ nhiệm tuần báo Văn (tiền thân của báo Văn nghệ).\r\n\r\nNguyễn Công Hoan mất ngày 6 tháng 6 năm 1977 tại Hà Nội. Tên ông được đặt cho một phố ở Hà Nội, đoạn giữa hai phố Ngọc Khánh và Nguyễn Chí Thanh. Nguyễn Công Hoan được tặng Giải thưởng Hồ Chí Minh về Văn học nghệ thuật năm 1996.\r\n***\r\nNăm giờ chiều hôm sau ở chợ Gỏi, người ta đã thấy phường kèn trống, bát âm, và phu đòn, sắp sẵn nhà táng lính xa ngồi chờ ở gốc đa để đón đám ma.\r\n\r\nCảnh xuân mà ảm đạm. Mặt trời chìm tây, hất cái bóng úa tàn lên những đám mây bạc mờ, lộn ra các mầu óng ánh như khảm. Cây khô chưa nẩy lộc, đứng lom khom bên cạnh đường. Khóm tre kẽo kẹt, làm tơi tả chiếc lá vàng sum soe bay, rồi nằm mắc trên bụi tầm xuân dại.\r\n\r\nMột chốc, ba chiếc ô tô từ đằng xa phăng phăng chạy lại, bốp còi inh ỏi, đến đầu chợ thì dừng.\r\n\r\nTiếng kèn nổi lên, theo gió đưa đi những giọt rền rỉ sầu thảm, khói hương phảng phất bay lên, đám ma thong thả theo lối rẽ vào làng Văn Ngoại, rồi đi quanh rặng tre trên bờ sông. Người đưa đám mỗi lúc một đông. Trông thấy Điệp, Xuân, và một vị sư bác chùa Phương Thành, nghiêm trang đi sát sau cữu, thì ai nấy đều nhớ đến cảnh ngộ Lan mà sụt sùi giọt lệ. Trời về chiều đã tăng cái vẻ sầu thảm, trời về chiều lại bày thêm cảnh đám ma có giọng khóc nỉ non ai oán… Tạo hóa như khéo vẽ nên bức tranh đoạn trường!\r\n\r\nTrống vẫn thúc, kèn vẫn rên. Hồn và xác Lan trong chiếc nhà táng, nghêng ngang theo sau tiếng bát âm ẻo lả, lượn vùng quanh lũy, qua mấy thửa ruộng trồng má đề thì hạ xuống, cạnh cái gò chính Điệp và Lan đã ngồi nói chuyện hôm mười sáu tháng năm khoảng mười lăm năm trước.\r\n\r\nTrời thấp dần. Núi non xa dần. Cảnh vật xung quanh đã nhuộm một mầu sẫm, buồn rười rượi như sắp chết. Bức màn sương, trên rủ xuống, xa đưa lại, cũng dần dà trùm khuất mọi nơi, rải rác vẻ u ám thê lương vào buổi chiều hôm hiu hắt.\r\n...\r\nMời các bạn đón đọc Tắt Lửa Lòng của tác giả Nguyễn Công Hoan.', '2024-04-25'),
(78, 'Cánh đồng bất tận', 29, 42, '66233df854bcc_8217.jpg', '66233df85420a_1864.pdf', 'Cánh đồng bất tận là tên một tập truyện ngắn phát hành năm 2005 của Nguyễn Ngọc Tư, đồng thời cũng là tên một truyện trong tập truyện ngắn đó được đăng báo lần đầu cùng năm. Tính đến nay, tập truyện đã được phát hành dưới dạng sách in và sách nói. Một vài truyện ngắn trong tuyển tập đã được chuyển thể thành phim và kịch.\r\n\r\nGồm có:\r\nCải ơi\r\nThương quá rau răm\r\nHuệ lấy chồng\r\nCái nhìn khắc khoải\r\nNhà cổ\r\nMối tình năm cũ\r\nCuối mùa nhan sắc\r\nBiển người mênh mông\r\nNhớ sông\r\nDòng nhớ\r\nDuyên phân so le\r\nMột trái tim khô...\r\nCánh đồng bất tận\r\nMời các bạn đón đọc ​Cánh Đồng Bất Tận của tác giả Nguyễn Ngọc Tư.', '2004-05-10');

--
-- Bẫy `books`
--
DELIMITER $$
CREATE TRIGGER `xoasach` BEFORE DELETE ON `books` FOR EACH ROW BEGIN
  DELETE FROM `history` WHERE `book_id` = OLD.id;
  DELETE FROM `wishlist` WHERE `book_id` = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `category` char(100) NOT NULL,
  `name` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category`, `name`) VALUES
(1, 'trinh-tham', 'Trinh Thám'),
(2, 'khoa-hoc', 'Khoa học'),
(3, 'tam-ly', 'Tâm lý'),
(4, 'lich-su', 'Lịch sử'),
(6, 'cong-nghe-thong-tin', 'Công nghệ thông tin'),
(7, 'tieu-thuyet', 'Tiểu thuyết'),
(8, 'kinh-te', 'Kinh tế'),
(9, 'chinh-tri', 'Chính trị'),
(17, 'van-hoc', 'Văn Học'),
(41, 'tieu-su', 'Tiểu sử'),
(42, 'truyen-ngan', 'Truyện ngắn'),
(43, 'tho', 'Thơ'),
(44, 'sach-tu-luc', 'Sách tự lực'),
(46, 'hoi-ky', 'Hồi ký');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `last_read` date NOT NULL DEFAULT (curdate())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(128) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `email`) VALUES
(20, 'huynhvan2003', '5aa5687dc0a563cbea3619dc16e091b89338af6252ab48ffd4fc76fe97954c8937cc8015a285eef456b7d507522e7cfe8159f837bc4d70eddae0408fd6aca809', 'Hà Huỳnh Văn', 'vanhuynh2003@gmail.com'),
(21, 'khacvi2003', '24ce3f2aab99e7b7ac7a53f55df3076bc2866f98845df14ab456e4259391d9a3e53c247ad7894bceb97e1d1919a17bfc727694981518039868154140e89b38db', 'ĐOÀN KHẮC Vi 2003', 'khacvi2003AZAA@gmail.com'),
(22, 'TriLam2003', 'd2a1946b6a19dd2af79fe08a7b6b0307f20749e53dfc590a5b418c1b525e250e0e49d8cd6e5ba0f77648b049cf2f923c49b90ee8474feb2ea672be59cc5d7ac1', 'LÂM QUANG TRÍ', 'triquang2003@gmail.com'),
(24, 'vidoan2003', '220bb8f18979105d2d76e47c57082848e694f9395e71a01afb11bf2396c20468c7ef9a091194bd0b038666e71d8487fefd16ee8c9dfe69728b2dbe0634e975d1', 'ĐOÀN KHẮC Vi', 'khacvi2003AZAA@gmail.com'),
(25, 'taydoc', '97b0fc3c8f9c2935f44f8854d75fc6aa8128c87a21b3104955402829425ecedbe17dac2d199aaf9388589973d6a1af386934d1dea29a47ac1ef262481318b727', 'van huynh', 'hahuynhvan159@gmail.com'),
(27, 'auduongphong', '64a5a64380b3861eed1db34d2d24f9fa0ddeb03e5f82e3f96582fe509b07384ee75ae018e3ebb806c62ee1b825e1ed20024b154dd1b95c7b463afb429c75d912', 'Âu Dương Phong', 'taydoc@gmail.com'),
(28, 'lenhhoxung', '1e4b158a909ba4627a98b83b14db16fbcf319be10cf7fa287119fd269757d57a72c506284ed02c7c92738751778f472ec48200da5c82e1b568b52b774339142e', 'Lệnh Hồ Xung', 'lenhhoxung@gmail.com'),
(29, 'dongta123', '97b0fc3c8f9c2935f44f8854d75fc6aa8128c87a21b3104955402829425ecedbe17dac2d199aaf9388589973d6a1af386934d1dea29a47ac1ef262481318b727', 'Hoàng Dược Sư', 'dongta123@gmail.com'),
(31, 'nhamngahanh123', '1e4b158a909ba4627a98b83b14db16fbcf319be10cf7fa287119fd269757d57a72c506284ed02c7c92738751778f472ec48200da5c82e1b568b52b774339142e', 'Nham Nga Hanh', 'nhatnguyet123@gmail.com'),
(32, 'khatranac123', '97b0fc3c8f9c2935f44f8854d75fc6aa8128c87a21b3104955402829425ecedbe17dac2d199aaf9388589973d6a1af386934d1dea29a47ac1ef262481318b727', 'Kha Tran Ac', 'thatquai123@gmail.com');

--
-- Bẫy `users`
--
DELIMITER $$
CREATE TRIGGER `xoauser` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
  DELETE FROM `history` WHERE `user_id` = OLD.`id`;
  DELETE FROM `wishlist` WHERE `user_id` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vwadmin`
-- (See below for the actual view)
--
CREATE TABLE `vwadmin` (
`id` int
,`username` varchar(50)
,`password` char(128)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vwauthors`
-- (See below for the actual view)
--
CREATE TABLE `vwauthors` (
`id` int
,`author` varchar(100)
,`description` text
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vwbooks`
-- (See below for the actual view)
--
CREATE TABLE `vwbooks` (
`id` int
,`title` varchar(100)
,`author_id` int
,`category_id` int
,`cover_path` varchar(260)
,`file_path` varchar(260)
,`description` text
,`published` date
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vwcategories`
-- (See below for the actual view)
--
CREATE TABLE `vwcategories` (
`id` int
,`category` char(100)
,`name` char(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vwhistory`
-- (See below for the actual view)
--
CREATE TABLE `vwhistory` (
`id` int
,`name` varchar(100)
,`title` varchar(100)
,`last_read` date
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vwusers`
-- (See below for the actual view)
--
CREATE TABLE `vwusers` (
`id` int
,`username` varchar(50)
,`password` char(128)
,`name` varchar(100)
,`email` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vwwishlist`
-- (See below for the actual view)
--
CREATE TABLE `vwwishlist` (
`id` int
,`name` varchar(100)
,`title` varchar(100)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `book_id`) VALUES
(97, 21, 61),
(98, 21, 63),
(99, 24, 59),
(100, 24, 12),
(104, 25, 7),
(105, 25, 77),
(106, 25, 57),
(107, 25, 58),
(114, 25, 13);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vwadmin`
--
DROP TABLE IF EXISTS `vwadmin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadmin`  AS SELECT `admin`.`id` AS `id`, `admin`.`username` AS `username`, `admin`.`password` AS `password` FROM `admin` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vwauthors`
--
DROP TABLE IF EXISTS `vwauthors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwauthors`  AS SELECT `authors`.`id` AS `id`, `authors`.`author` AS `author`, `authors`.`description` AS `description` FROM `authors` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vwbooks`
--
DROP TABLE IF EXISTS `vwbooks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwbooks`  AS SELECT `books`.`id` AS `id`, `books`.`title` AS `title`, `books`.`author_id` AS `author_id`, `books`.`category_id` AS `category_id`, `books`.`cover_path` AS `cover_path`, `books`.`file_path` AS `file_path`, `books`.`description` AS `description`, `books`.`published` AS `published` FROM `books` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vwcategories`
--
DROP TABLE IF EXISTS `vwcategories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwcategories`  AS SELECT `categories`.`id` AS `id`, `categories`.`category` AS `category`, `categories`.`name` AS `name` FROM `categories` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vwhistory`
--
DROP TABLE IF EXISTS `vwhistory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwhistory`  AS SELECT `history`.`id` AS `id`, `users`.`name` AS `name`, `books`.`title` AS `title`, `history`.`last_read` AS `last_read` FROM ((`history` join `users` on((`history`.`user_id` = `users`.`id`))) join `books` on((`history`.`book_id` = `books`.`id`))) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vwusers`
--
DROP TABLE IF EXISTS `vwusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwusers`  AS SELECT `users`.`id` AS `id`, `users`.`username` AS `username`, `users`.`password` AS `password`, `users`.`name` AS `name`, `users`.`email` AS `email` FROM `users` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vwwishlist`
--
DROP TABLE IF EXISTS `vwwishlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwwishlist`  AS SELECT `wishlist`.`id` AS `id`, `users`.`name` AS `name`, `books`.`title` AS `title` FROM ((`wishlist` join `users` on((`wishlist`.`user_id` = `users`.`id`))) join `books` on((`wishlist`.`book_id` = `books`.`id`))) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `authors` ADD FULLTEXT KEY `author` (`author`);

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`author_id`);
ALTER TABLE `books` ADD FULLTEXT KEY `title` (`title`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
