<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
      <div class="container">
        <div class="row my-5">
          <h4 class="h4">レビューを新規作成</h4>
        </div>
        <form action="control" method="post">
          <input type="hidden" name="action_name" value="review_create" />
          <div class="row">
            <div class="col">
              <div class="form-group">
                <label for="title">タイトル</label>
                <input id="title" class="form-control" name="title" type="text" placeholder="タイトル"  maxlength="30"/>
              </div>
              <div class="form-group">
                <label for="comment">コメント</label>
                <textarea id="comment" class="form-control" name="comment" rows="3" placeholder="コメント" maxlength="300" ></textarea>
              </div>
            </div>

            <div class="col">
              <div class="form-group">
                <label for="rating">評価：　</label>
                <div id="rating">
                  <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" id="check-5" name="rating" value="5" checked>
                    <label class="form-check-label" for="check-5">5.最高</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" id="check-4" name="rating" value="4">　
                    <label class="form-check-label" for="check-5">4.とても良い</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" id="check-3" name="rating" value="3">　 
                    <label class="form-check-label" for="check-5">3.良い</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" id="check-2" name="rating" value="2">　
                    <label class="form-check-label" for="check-5">2.普通</label>
                  </div>
                  <div class="form-check form-check-inline">
                   <input type="radio" class="form-check-input" id="check-1" name="rating" value="1"> 
                    <label class="form-check-label" for="check-5">1.良くない</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="budget">1人当たりの予算</label>
                <select name="budget" class="form-control">
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
              </div>
              <div class="form-group">
                <label for="atmosphare">お店の雰囲気</label>
                <div id="atmosphare">
                  <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" id="forParty" name="forParty" value="forParty">
                    <label class="form-check-label" for="forParty">宴会向き</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" id="forReception" name="forReception" value="forReception">
                    <label class="form-check-label" for="forReception">接待向き</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" id="forDate" name="forDate" value="forDate">
                    <label class="form-check-label" for="forDate">デート向き</label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="detail" >詳細情報</label>
                <div id="detail">
                  <div class="form-check form-check-inline">
                    <input type="checkbox" name="tabaco" id="tabako" value=ture>
                    <label class="form-check-label" for="tabako">たばこ</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="checkbox" name="free" id="drink" value="free">
                    <label class="form-check-label" for="drink">飲み放題</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="checkbox" name="partySpace" id="party" value="partySpace">
                    <label class="form-check-label" for="party">宴会場</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input type="checkbox" name="reservation" id="reserve" value="reservation">
                    <label class="form-check-label" for="reserve">予約可</label>
                  </div>
                </div>
              </div>
              <input type="hidden" name="userId" value=${user.userId } />
              <input type="hidden" name="apiId" value=${apiId } />
              <div class="form-group text-right">
                <input type="submit" class="btn btn-secondary" value="登録" />
              </div>
            </div>
          </div>
        </form>
      </div>
    </main>
    
    <!-- footer -->
    <%@ include file="template/footer.jsp" %>
    
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyBYxzFJkG_P15cNs_NQzwCw9QktNHTIlvU&language=ja"></script>
    <script src="js/googlemap.js"></script>
  </body>
</html>