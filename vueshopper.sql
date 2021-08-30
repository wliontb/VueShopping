-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2021 at 06:32 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vueshopper`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `blog_desc`, `thumbnail`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Tổ Chức Áo Đen trong Conan?', 'Đó là câu hỏi mà cho đến nay nhiều fan của Thám Tử Lừng Danh Conan vẫn thắc mắc. Nếu Haibara không mất đi chị gái của mình thì liệu cô có phản lại Tổ Chức Áo Đen.', '/storage/blogs/thumb1623813765.jpeg', 'Akemi là chị gái của Haibara và là người xuất hiện trong Conan chap 16. Trong chap này, Akemi đã \"chạm mặt\" Gin và Vodka, hai thành viên quan trọng của Tổ Chức Áo Đen. Gin yêu cầu Akemi giao lại số tiền cô từng cướp nhà băng. Akemi đe dọa Gin rằng nếu hắn không thả em gái mình ra thì sẽ chẳng có khoản tiền nào từ cô cả. Với tính cách máu lạnh của mình thì Gin đã bắn chết Akemi ngay tại chỗ.\nNếu chị gái của mình không chết thì liệu Haibara có mến Conan hay sẽ giết cậu vì Tổ Chức Áo Đen? - Ảnh 1.\n\nChính sự kiện này đã khiến Shiho Miyano, em gái của Akemi Miyano muốn phản bội lại và trả thù Tổ Chức Áo đen. Cô rất thông minh nên được coi là 1 thiên tài trong ngành hóa dược và cũng chính là tác giả của loại độc dược APTX4869 đã khiến Shinichi bị teo nhỏ. Sau cái chết của chị gái Akemi, cô quyết tâm rời bỏ tổ chức do sự bất mãn vốn có đối với tổ chức của cô càng thêm sâu đậm, nên bị bọn Áo Đen còng tay nhốt vào 1 căn phòng chứa toàn khí ga.\nNếu chị gái của mình không chết thì liệu Haibara có mến Conan hay sẽ giết cậu vì Tổ Chức Áo Đen? - Ảnh 2.\n\nNghĩ rằng mình không thể thoát khỏi cái chết nên Sherry đã tự sát bằng 1 viên APTX 4869 nhưng may mắn cô không chết mà cơ thể bị teo nhỏ thành một đứa trẻ 7 tuổi giống như Shinichi. Sherry chạy trốn và bắt đầu sống dưới cái tên mới là Haibara Ai ở nhà tiến sĩ Agasa. Từ đó, Haibara cùng với Conan âm thầm cùng nhau truy tìm tung tích bọn Áo Đen với mong muốn tìm được tư liệu về APTX4869 để chế thuốc giải độc. Như vậy một điều dễ hiểu đó là việc chính nhờ vào cái chết của Akemi mà Haibara mới trở thành bạn và thậm chí là thân thiết với Conan như những gì mà chúng ta đang biết. Vậy trong trường hợp Haibara không trải qua biến cố mất chị gái thì điều gì sẽ diễn ra?\n\nNgay từ đầu, Haibara cũng không hẳn là tốt đẹp. Cô theo phe Conan là do tin họ sẽ có cách báo thù Tổ Chức Áo Đen cho chị gái mình. Vậy thì chuyện gì sẽ diễn ra nếu Akemi không chết sớm? Rất có thể Haibara sẽ không tự uống APTX 4869. Cô ấy vẫn sẽ là Miyano Shiho. Và tất nhiên, cô ta sẽ chẳng có lý do gì để phản bội lại Tổ Chức Áo Đen cả. Trong trường hợp này, tính mạng Conan chắc chắn sẽ gặp nguy hiểm. Vì theo như những gì chúng ta đã biết, Haibara sở hữu một lượng tri thức đáng kinh ngạc. Và sẽ rất tồi tệ nếu đống tri thức và sự thông minh đó của Haibara được xài để phục vụ cho những tên tội phạm Áo Đen truy lùng và tiêu diệt Conan.', 3, '2021-06-15 06:12:15', '2021-06-15 20:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cate_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_display` int(11) NOT NULL DEFAULT 0,
  `hot_display` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `cate_desc`, `thumbnail`, `home_display`, `hot_display`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Truyện tranh', 'truyen-tranh', 'Truyện tranh, comic, manga đủ thể loại', '/storage/categories/1623811460.jpeg', 1, 1, '2021-05-30 04:38:40', '2021-06-15 19:44:20', 0),
(2, 'Sách Kinh Tế', 'sach-kinh-te', 'Sách kinh tế các kiểu', '/storage/categories/1623811474.jpeg', 0, 1, '2021-05-30 08:28:54', '2021-06-15 19:44:34', 0),
(3, 'Tiểu thuyết', 'tieu-thuyet', 'Sách thuộc thể loại tiểu thuyết', '/storage/categories/1623685986.jpeg', 1, 1, '2021-05-30 08:36:25', '2021-06-14 08:53:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_28_101231_create_products_table', 1),
(5, '2021_05_30_081120_create_categories_table', 2),
(6, '2021_05_30_082029_add_more_column_to_table_products', 3),
(7, '2021_05_30_083810_add_parent_id_to_table_categories', 4),
(8, '2021_06_02_170508_create_product_images_table', 5),
(9, '2021_06_03_111401_create_orders_table', 6),
(10, '2021_06_03_112612_create_product_orders_table', 6),
(11, '2021_06_04_040045_update_table_users', 7),
(12, '2021_06_15_121545_create_blogs_table', 8),
(13, '2021_06_15_144046_create_sliders_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment` int(11) NOT NULL DEFAULT 1,
  `payed` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `address`, `note`, `total`, `quantity`, `payment`, `payed`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Tuấn Anh', 'tuananh1@gmail.com', 987196812, 'Thái Bình', NULL, 36200, 3, 1, 0, 1, 1, '2021-06-03 07:39:32', '2021-06-03 07:39:32'),
(2, 'thanh hiền', 'tuananh1@gmail.com', 113, 'hải dương', 'thích đọc doremon', 200, 1, 1, 0, 1, 1, '2021-06-03 07:58:20', '2021-06-15 20:18:37'),
(3, 'Nguyễn Huyền Nhung', 'nhungxiem124@gmail.com', 987196812, 'Hải Phòng', NULL, 375000, 4, 1, 0, 1, 1, '2021-06-15 11:05:13', '2021-06-15 20:59:10'),
(4, 'tuananh', 'tuananh1@gmail.com', 115, 'aaaa', 'test', 375000, 4, 1, 0, 0, 1, '2021-06-15 11:10:21', '2021-06-15 11:10:21'),
(5, 'Thanh Nga', 'thanhnga9@gmail.com', 115, 'Hà Giang', NULL, 126000, 3, 1, 0, 0, NULL, '2021-06-15 15:36:35', '2021-06-15 15:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_price` int(11) NOT NULL,
  `current_price` int(11) NOT NULL,
  `inventory` int(11) NOT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chap` int(11) NOT NULL DEFAULT 1,
  `page_number` int(11) NOT NULL,
  `cover_form` int(11) NOT NULL DEFAULT 1,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tiếng Việt',
  `star` int(11) NOT NULL DEFAULT 5,
  `recommend_display` int(11) NOT NULL DEFAULT 0,
  `deal_display` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `thumbnail`, `product_desc`, `detail_desc`, `old_price`, `current_price`, `inventory`, `sold`, `created_at`, `updated_at`, `slug`, `author`, `publisher`, `series`, `chap`, `page_number`, `cover_form`, `language`, `star`, `recommend_display`, `deal_display`, `category_id`) VALUES
(1, 'OVERLORD - Tập 1: Chúa Tể Bất Tử', '/storage/products/1623740543.jpeg', 'Mới mẻ, suy tư, mạnh mẽ, Overlord 1 mở ra, từ bước chân thăm dò của chúa tể…', 'bla bla akska', 135000, 121000, 100, 0, '2021-05-28 03:54:32', '2021-06-15 00:02:23', 'overlord-tap-1-chua-te-bat-tu', 'Maruyama Kugane', 'NXB Hồng Đức', 'Overlord lightnovel', 1, 0, 1, 'Tiếng Việt', 5, 0, 0, 1),
(2, 'OVERLORD - Tập 2: Chiến Binh Bóng Tối', '/storage/products/overlord2.jpg', 'Không biết chữ, không có tiền, tìm việc làm, cẩn trọng thăm dò môi trường mới, gặp gỡ nhiều nhân vật thuộc nhiều thành phần, đi săn một sinh ', 'mô tả dài của truyện', 135000, 108000, 100, 0, '2021-05-28 03:55:05', '2021-05-28 03:55:05', '', 'Maruyama Kugane', 'NXB Hồng Đức', 'Overlord lightnovel', 2, 0, 1, 'Tiếng Việt', 5, 0, 0, 2),
(3, 'OVERLORD - Tập 3: Valkyrie Khát Máu', '/storage/products/overlord3.jpg', 'Một, nhân vật chính là người bình thường, không biết gì cả, lơ ngơ đơn thuần', 'mô tả dài của truyện', 135000, 110000, 100, 0, '2021-05-28 03:55:17', '2021-06-14 21:48:25', 'overlord-tap-3-valkyrie-khat-mau', 'Maruyama Kugane', 'NXB Hồng Đức', 'Overlord lightnovel', 3, 0, 1, 'Tiếng Việt', 5, 0, 0, 1),
(4, 'OVERLORD - Tập 4: Lizarmand Anh Dũng', '/storage/products/overlord4.jpg', 'Overlord kể về Suzuki Satoru, hay Ainz, một nhân viên văn phòng say mê tâm huyết với game ruột YGGDRASIL', 'mô tả dài của truyện', 135000, 117000, 100, 0, '2021-05-28 03:55:30', '2021-05-28 03:55:30', '', 'Maruyama Kugane', 'NXB Hồng Đức', 'Overlord lightnovel', 4, 0, 1, 'Tiếng Việt', 5, 0, 0, 3),
(6, 'Doraemon Tập 19: Nobita - Vũ Trụ Phiêu Lưu Kí6', '/storage/products/1623733762.jpeg', 'Mỗi tập truyện là một cuộc phưu lưu khám phá những chân trời mới lạ. Hãy để trí tưởng tượng của bạn bay bổng cùng nhóm bạn Doraemon, Nobita, Shizuka, Jaian, Suneo zz', 'chuyen du lich long datzz', 18000, 13000, 100, 0, '2021-06-02 12:42:40', '2021-06-14 23:34:51', 'doraemon-tap-19-nobita-vu-tru-phieu-luu-ki6', 'Fujiko F Fujio', 'Nhà Xuất Bản Kim Đồng', 'Tuyển tập 24 truyện dài Đô rê mon', 1, 100, 1, 'Tiếng Việt', 5, 1, 0, 1),
(7, 'Doraemon Tranh Truyện Màu - Tập 8 - Nobita Và Binh Đoàn Người Sắt ', '/storage/products/doremon2.jpg', '“Nobita và binh đoàn người sắt” là tác phẩm thứ 7 trong loạt phim hoạt hình rất được mến mộ “Doraemon” được chuyển thể từ nguyên tác truyện tranh của tác giả Fujko.F.Fujio', 'truyen dai cuc hay', 50000, 45000, 100, 0, '2021-06-02 13:10:11', '2021-06-02 13:10:11', 'doremon-va-chu-khung-long', 'Fujiko F Fujio', 'Nhà Xuất Bản Kim Đồng', 'Tuyển tập 24 truyện dài Đô rê mon', 2, 188, 0, 'Tiếng Việt', 5, 1, 1, 1),
(8, 'One-Punch Man Tập 7: Quyết Đấu', '/storage/products/opm1.jpg', 'Câu chuyện diễn ra tại thành phố Z, Nhật Bản. Thế giới đầy quái vật bí ẩn xuất hiện và gây ra nhiều thảm họa. Nhân vật chính Saitama (Onepunch Man)', 'Câu chuyện diễn ra tại thành phố Z, Nhật Bản. Thế giới đầy quái vật bí ẩn xuất hiện và gây ra nhiều thảm họa. Nhân vật chính Saitama (Onepunch Man), một siêu anh hùng dễ dàng đánh bại các quái vật hay những nhân vật phản diện khác chỉ với một cú đấm.Tuy nhiên, sau khi trở thành quá mạnh, Saitama đã trở nên nhàm chán trong những trận chiến của mình và luôn cố gắng để tìm đối thủ mạnh hơn để chiến đấu.', 20000, 18000, 100, 0, '2021-06-02 13:25:02', '2021-06-02 13:25:02', 'onepunch-man', 'MURATA Yusuke, One', 'Nhà Xuất Bản Kim Đồng', 'One Punch Man', 1, 100, 0, 'Tiếng Việt', 5, 1, 1, 3),
(9, 'Bước Chậm Lại Giữa Thế Gian Vội Vã', '/storage/products/buochamlai1.jpg', 'Ra mắt lần đầu năm 2012, Bước chậm lại giữa thế gian vội vã của Đại đức Hae Min đã liên tục đứng đầu danh sách best-seller của nhiều trang sách trực tuyến uy tín của Hàn Quốc, trở thành cuốn', 'Chen vai thích cánh để có một chỗ bám trên xe buýt giờ đi làm, nhích từng xentimét bánh xe trên đường lúc tan sở, quay cuồng với thi cử và tiến độ công việc, lu bù vướng mắc trong những mối quan hệ cả thân lẫn sơ… bạn có luôn cảm thấy thế gian xung quanh mình đang xoay chuyển quá vội vàng?\r\n\r\nNếu có thể, hãy tạm dừng một bước.\r\n\r\nĐể tự hỏi, là do thế gian này vội vàng hay do chính tâm trí bạn đang quá bận rộn? Để cầm cuốn sách nhỏ dung dị mà lắng đọng này lên, chậm rãi lật giở từng trang, thong thả khám phá những điều mà chỉ khi bước chậm lại mới có thể thấu rõ: về các mối quan hệ, về chính bản thân mình, về những trăn trở trước cuộc đời và nhân thế, về bao điều lý trí rất hiểu nhưng trái tim chưa cách nào nghe theo…\r\n\r\nRa mắt lần đầu năm 2012, Bước chậm lại giữa thế gian vội vã của Đại đức Hae Min đã liên tục đứng đầu danh sách best-seller của nhiều trang sách trực tuyến uy tín của Hàn Quốc, trở thành cuốn sách chữa lành cho hàng triệu người trẻ luôn tất bật với nhịp sống hiện đại hối hả.', 85000, 68000, 100, 0, '2021-06-04 07:54:07', '2021-06-04 07:54:07', 'buoc-cham-lai-giua-the-gian-voi-va', 'Hae Min', 'Nhã Nam', 'Top 100 sản phẩm Tiểu thuyết bán chạy của tháng', 1, 254, 0, 'Tiếng Việt', 5, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_name`, `image_path`, `created_at`, `updated_at`) VALUES
(4, 7, 'iphone11.jpg', '/storage/uploads/products/iphone11.jpg', '2021-06-02 13:10:11', '2021-06-02 13:10:11'),
(5, 7, 'iphone12.jpg', '/storage/uploads/products/iphone12.jpg', '2021-06-02 13:10:11', '2021-06-02 13:10:11'),
(6, 7, 'iphone111.jpg', '/storage/uploads/products/iphone111.jpg', '2021-06-02 13:10:11', '2021-06-02 13:10:11'),
(7, 8, 'overlord.jpg', '/storage/products/overlord.jpg', '2021-06-02 13:25:02', '2021-06-02 13:25:02'),
(8, 8, 'sachkinhte1.jpg', '/storage/products/sachkinhte1.jpg', '2021-06-02 13:25:02', '2021-06-02 13:25:02'),
(9, 8, 'truyentranh1.jpg', '/storage/products/truyentranh1.jpg', '2021-06-02 13:25:02', '2021-06-02 13:25:02'),
(10, 9, 'buochamlai1.jpg', '/storage/products/buochamlai1.jpg', '2021-06-04 07:54:07', '2021-06-04 07:54:07'),
(11, 9, 'buochamlai2.gif', '/storage/products/buochamlai2.gif', '2021-06-04 07:54:07', '2021-06-04 07:54:07'),
(12, 9, 'buochamlai3.gif', '/storage/products/buochamlai3.gif', '2021-06-04 07:54:07', '2021-06-04 07:54:07'),
(16, 6, '1623738890.jpeg', '/storage/products/1623738890.jpeg', '2021-06-14 23:34:51', '2021-06-14 23:34:51'),
(17, 6, '1623738891.jpeg', '/storage/products/1623738891.jpeg', '2021-06-14 23:34:51', '2021-06-14 23:34:51'),
(18, 6, '1623738891.jpeg', '/storage/products/1623738891.jpeg', '2021-06-14 23:34:51', '2021-06-14 23:34:51'),
(22, 1, '01623740543.jpeg', '/storage/products/01623740543.jpeg', '2021-06-15 00:02:23', '2021-06-15 00:02:23'),
(23, 1, '11623740543.jpeg', '/storage/products/11623740543.jpeg', '2021-06-15 00:02:23', '2021-06-15 00:02:23'),
(24, 1, '21623740543.jpeg', '/storage/products/21623740543.jpeg', '2021-06-15 00:02:23', '2021-06-15 00:02:23'),
(28, 10, '01623750918.jpeg', '/storage/products/01623750918.jpeg', '2021-06-15 02:55:19', '2021-06-15 02:55:19'),
(29, 10, '11623750919.jpeg', '/storage/products/11623750919.jpeg', '2021-06-15 02:55:19', '2021-06-15 02:55:19'),
(30, 10, '21623750919.jpeg', '/storage/products/21623750919.jpeg', '2021-06-15 02:55:19', '2021-06-15 02:55:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `product_id`, `order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 2, '2021-06-03 07:39:32', '2021-06-03 07:39:32'),
(2, 7, 1, 1, '2021-06-03 07:39:32', '2021-06-03 07:39:32'),
(3, 6, 2, 1, '2021-06-03 07:58:20', '2021-06-03 07:58:20'),
(4, 3, 3, 3, '2021-06-15 11:05:13', '2021-06-15 11:05:13'),
(5, 7, 3, 1, '2021-06-15 11:05:13', '2021-06-15 11:05:13'),
(6, 3, 4, 3, '2021-06-15 11:10:21', '2021-06-15 11:10:21'),
(7, 7, 4, 1, '2021-06-15 11:10:21', '2021-06-15 11:10:21'),
(8, 7, 5, 1, '2021-06-15 15:36:35', '2021-06-15 15:36:35'),
(9, 6, 5, 1, '2021-06-15 15:36:35', '2021-06-15 15:36:35'),
(10, 9, 5, 1, '2021-06-15 15:36:35', '2021-06-15 15:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `description`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'Vui lễ thiếu nhi', 'Slide sale 1/6 vui lễ thiếu nhi', '/storage/sliders/slide1623773156.jpeg', '2021-06-15 08:02:24', '2021-06-15 09:05:56'),
(2, 'Slide covid', 'Slide covid ở nhà vẫn vui', '/storage/sliders/slide1623773185.png', '2021-06-15 09:06:25', '2021-06-15 09:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `orders` int(11) NOT NULL DEFAULT 0,
  `whishlists` int(11) NOT NULL DEFAULT 0,
  `awaitdelivery` int(11) NOT NULL DEFAULT 0,
  `delivered` int(11) NOT NULL DEFAULT 0,
  `role` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `address`, `phone`, `orders`, `whishlists`, `awaitdelivery`, `delivered`, `role`) VALUES
(1, 'Nguyễn Tuấn Anh', 'tuananh1@gmail.com', NULL, '$2y$10$4Z5Xr/YyppvzR3OkfIciD.mZEfdtYylrn2AmWlSseRKrHOw2RRFDq', NULL, '2021-05-28 11:10:18', '2021-06-15 18:44:52', NULL, NULL, 0, 0, 0, 0, 1),
(2, 'Nguyễn Tuấn Anh', 'thanhvien1@gmail.com', NULL, '$2y$10$PVUkAi4RNNw1r41ZbdtMSOLeTW1vD45j7VCxEQXC2kEesHKMxTQFK', NULL, '2021-05-29 03:41:02', '2021-06-15 18:44:25', NULL, NULL, 0, 0, 0, 0, 1),
(3, 'admin', 'admin@gmail.com', NULL, '$2y$10$4Z5Xr/YyppvzR3OkfIciD.mZEfdtYylrn2AmWlSseRKrHOw2RRFDq', NULL, '2021-06-15 19:43:25', '2021-06-15 19:43:25', NULL, NULL, 0, 0, 0, 0, 1),
(4, 'mikanhung9', 'nhung99900@gmail.com', NULL, '$2y$10$Jjr.iOWjU1KPMhMSL/T2euO93OxmS5CQDCLyz6vD9uGAoE5oPG5ky', NULL, '2021-06-15 19:51:45', '2021-06-15 19:51:45', NULL, NULL, 0, 0, 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
