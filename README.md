**<%@  page ... %>** : 페이지 속성을 설정하기 위해 사용하는 지시어  
**<%! ... %>** : 전역 변수 및 메서드를 선언하기 위해 사용하는 선언부  
**<%= ... %>** : out.print함수 없이 변수나 메소드를 출력하기 위해 사용하는 표현식  
**<% ... %>** : JSP 페이지 내에 Java 코드를 삽입하기 위해 사용하는 스크립틀릿  

*****
**Mission6**
---
### **InsertForm.jsp :**
 - 회원 등록 폼을 표시하는 페이지.  
 - 로그인된 상태인 경우 회원 등록 폼 대신 사용자의 이름과 로그아웃 링크를 표시함.  
 - 폼에서 submit 시 InsertProcess.jsp로 이동하며, 유효성을 검사하는 JavaScript 함수가 정의되어 있음.

### **InsertProcess.jsp :**
 - 회원 정보를 데이터베이스에 삽입하는 페이지.  
 - 데이터베이스 연결을 위해 common.JDBConnect 클래스 사용.  
 - 사용자로부터 전달받은 아이디, 패스워드, 이름으로 SQL 쿼리를 실행해 데이터베이스에 삽입.  
 - 성공 시 InsertSuccess.jsp로, 실패 시 InsertFail.jsp로 리다이렉트.
   
### **InsertSuccess.jsp :**
 - 회원 등록에 성공한 경우 표시되는 페이지.  
 - "InsertForm.jsp" 링크를 통해 회원 등록 폼으로 돌아갈 수 있음.  
 
### **InsertFail.jsp :**
 - 회원 등록에 실패한 경우 표시되는 페이지.  
 - InsertForm.jsp" 링크를 통해 회원 등록 폼으로 돌아갈 수 있음.  

*****
**Mission7**
---
### **InsertBoardForm.jsp :**
- 게시물을 작성할 수 있는 양식을 표시하는 페이지.
- 사용자가 로그인한 경우에만 게시물 등록을 허용함.
- 사용자가 로그인되어 있지 않은 경우 LoginForm.jsp으로 리다이렉트.

### **InsertBoardProcess.jsp :**
- 제출된 게시물 작성 정보를 처리하고 데이터베이스에 삽입하는 페이지.
- 결과에 따라 성공 또는 실패 페이지로 리다이렉트.

### **InsertBoardSuccess.jsp :**
- 게시물 등록에 성공한 경우 이동하는 페이지.  
- "InsertBoardForm.jsp" 링크를 통해 게시물 등록 폼으로 돌아갈 수 있음.  

### **InsertBoardFail.jsp :**
-  게시물 등록에 실패한 경우 이동하는 페이지.  
- "InsertBoardForm.jsp" 링크를 통해 게시물 등록 폼으로 돌아갈 수 있음.  

### **LoginForm.jsp :**
- 로그인 폼을 표시하는 페이지.

### **LoginProcess.jsp :**
- 제출된 로그인 시도를 처리하는 페이지.
- 유효성을 검사하고 결과에 따라 성공 또는 실패 페이지로 리다이렉트.
  
### **LoginSuccess.jsp :**
- 로그인에 성공한 경우 표시되는 페이지.
- "InsertBoardForm.jsp" 링크를 통해 게시물 등록 폼으로 이동할 수 있음.

### **LoginFail.jsp :**
- 로그인에 실패한 경우 표시되는 페이지.
- "LoginForm.jsp" 링크를 통해 로그인 폼으로 돌아갈 수 있음.
