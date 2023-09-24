<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ja">
  <!-- head -->
  <jsp:include page="template/head.jsp">
    <jsp:param name="page" value="delete" />
  </jsp:include>

  <body>
    <header id="header">
      <jsp:include page="template/top.jsp" />
    </header>
    <main id="main">
      <h1>レビューを新規作成</h1>
      <hr>
      <form action="control" method="post">
        <input type="hidden" name="action_name" value="review_create" />
        <p>
          <label for="title">タイトル</label>
          <input id="title" name="title" type="text" placeholder="タイトル"  maxlength="30"/>
        </p>
        <p>
          <label for="rating">評価：　</label>
          <input type="radio" name="rating" value="Excellent">5.最高　
          <input type="radio" name="rating" value="VeryGood">4.とても良い　
          <input type="radio" name="rating" value="Good">3.良い　 
          <input type="radio" name="rating" value="Fair">2.普通　
          <input type="radio" name="rating" value="Poor">1.良くない 
        </p>
        <p>
          <label for="price">1人当たりの金額</label>
          <select name="Price">
            <option value="~￥1,000">~￥1,000</option>
            <option value="￥1,000~2,000">￥1,000~2,000</option>
            <option value="￥2,000~3,000">￥2,000~3,000</option>
            <option value="￥3,000~4,000">￥3,000~4,000</option>
            <option value="￥4,000~5,000">￥4,000~5,000</option>
            <option value="￥5,000~6,000">￥5,000~6,000</option>
            <option value="￥6,000~8,000">￥6,000~8,000</option>
            <option value="￥8,000~10,000">￥8,000~10,000</option>
            <option value="￥10,000~15,000">￥10,000~15,000</option>
            <option value="￥15,000~20,000">￥15,000~20,000</option>
            <option value="￥20,000~30,000">￥20,000~30,000</option>
            <option value="￥30,000~40,000">￥30,000~40,000</option>
            <option value="￥40,000~50,000">￥40,000~50,000</option>
            <option value="￥50,000~60,000">￥50,000~60,000</option>
            <option value="￥60,000~80,000">￥60,000~80,000</option>
            <option value="￥80,000~100,000">￥80,000~100,000</option>
            <option value="￥100,000~">￥100,000~</option>
          </select>
        </p>
        <p>
          <label for="detail">詳細情報</label>
          <input type="checkbox" name="SmokingAllowed" value="Yes">
          <input type="checkbox" name="FreeDrink" value="Yes">
          <input type="checkbox" name="EventSpace" value="Yes">
          <input type="checkbox" name="Reserve" value="Yes">
        </p>
        <p>
          <label for="comment">コメント</label>
          <input id="comment" name="comment" type="text" size=100 placeholder="コメント" maxlength="300" />
        </p>
        <input type="hidden" name="userId" value=${user.userId } />
        <input type="hidden" name="apiId" value=${apiId } />
        <p>
          <input type="submit" value="登録" />
        </p>
      </form>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>
    
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
  </body>
</html>