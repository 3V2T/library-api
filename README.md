### **Lưu ý: cần bật Docker trước khi chạy command**  
# **B1: Clone project về**  
![image](https://github.com/3V2T/library-api/assets/93394403/c100395a-cafa-4d8b-a763-ccc3531e7058)  
# **B2: Chạy lệnh docker compose up -d -V**  
**Lưu ý: cần chạy command trong thư mục chứa project**
![image](https://github.com/3V2T/library-api/assets/93394403/30691a49-6d6b-4216-b05d-ff1b6b2bb682)  
Hiển thị như hàng cuối thì mới chuyển sang bước tiếp theo. Nhớ là phải có bind address rồi.  
# **B3: Import database vào**  
Vào phpmyadmin bằng trình duyệt web với đường dẫn localhost, username: root, password: mysql  
![image](https://github.com/3V2T/library-api/assets/93394403/4a543cfa-f01e-4881-9408-b9137b13be9a)  
Chọn database library  
![image](https://github.com/3V2T/library-api/assets/93394403/94e45cf3-d100-4aab-b723-b7dbb8c66654)  
Chọn Import hoặc Nhập  
![image](https://github.com/3V2T/library-api/assets/93394403/8c54dcae-42ff-4d13-b499-dba1dab1c057)  
Chọn tệp để import vào  
Ở đây tôi dùng file new_library trong folder setup_db  
![image](https://github.com/3V2T/library-api/assets/93394403/670c8cd9-94dc-49df-9a79-3f4fe2be43b7)  
Cuộn xuống dưới cùng và chọn Nhập hoặc Import  
![image](https://github.com/3V2T/library-api/assets/93394403/a4ddfbd3-c980-46aa-a6a5-f25e6fa51bf5)  
Nhập hoàn tất  
![image](https://github.com/3V2T/library-api/assets/93394403/c399fd3e-fe5d-43ae-a6d2-5fd2492f97a1)  
Cài đặt api hoàn tất  
Bây giờ có thể vào lapi.ayclqt.id.vn để kiểm tra api  
![image](https://github.com/3V2T/library-api/assets/93394403/bc343779-e26b-43f4-add6-7189cf5d0329)  
Check author  
![image](https://github.com/3V2T/library-api/assets/93394403/1af769a7-7de9-4623-9c93-68c11c151657)  
Check book  
![image](https://github.com/3V2T/library-api/assets/93394403/8cba6ddd-b6af-44be-9ea5-9ab24b8344de)  
