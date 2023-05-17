<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="로그인" />
<%@ include file="../common/head.jspf"%>
<hr />
<script>

let container = document.getElementById('container')

toggle = () => {
  container.classList.toggle('sign-in')
  container.classList.toggle('sign-up')
}

setTimeout(() => {
  container.classList.add('sign-in')
}, 200)
</script>

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<form action="../member/doLogin" method="POST">
				<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
				<table border="1">
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								<input class="input input-bordered w-full max-w-xs" autocomplete="off" type="text" placeholder="아이디를 입력해주세요"
									name="loginId" />
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input class="input input-bordered w-full max-w-xs" autocomplete="off" type="text" placeholder="비밀번호를 입력해주세요"
									name="loginPw" />
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<button type="submit">로그인</button>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<a class="btn btn-active btn-ghost" href="${rq.findLoginIdUri }">아이디 찾기</a>
								<a class="btn btn-ghost btn-active" href="${rq.findLoginPwUri }">비밀번호찾기</a>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="btns">
			<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>


		</div>
	</div>
</section>


<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
      <!-- SIGN UP -->
      <div class="col align-items-center flex-col sign-up">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" placeholder="이름을 입력해주세요">
            </div>
            <div class="input-group">
              <i class='bx bx-mail-send'></i>
              <input type="email" placeholder="이메일을 입력해주세요">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="비밀번호를 입력해주세요">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="비밀번호를 다시 입력해주세요">
            </div>
            <button>
              가입하기
            </button>
            <p>
              <span>
               이미 가입하셨습니까?
              </span>
              <b onclick="toggle()" class="pointer">
                로그인 하기
              </b>
            </p>
          </div>
        </div>
      
      </div>



  
<%@ include file="../common/foot.jspf"%>