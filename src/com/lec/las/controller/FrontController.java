package com.lec.las.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.las.service.*;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());	
		String viewPage = null;
		Service service = null;		
		if(command.equals("/main.do")) {
			viewPage = "main/header.jsp";
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * * * member 관련 요청  * * * * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/loginView.do")) { // 로그인 화면
			viewPage = "member/login.jsp";
		}else if(command.equals("/login.do")) { // DB를 통해 로그인 확인 및 세션 처리
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/joinView.do")) { // 화면가입 화면
			viewPage = "member/join.jsp";
		}else if(command.equals("/midConfirm.do")) {
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/midConfirm.jsp";
		}else if(command.equals("/memailConfirm.do")) {
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/memailConfirm.jsp";
		}else if(command.equals("/join.do")) { // 회원가입 DB처리후 로그인으로 가고 id엔 가입한 id가 출력
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "loginView.do";
		}else if(command.equals("/logout.do")) { // 로그아웃 - 세션날리기
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/modifyView.do")) { // 정보 수정 화면
			viewPage = "member/modify.jsp";
		}else if(command.equals("/modify.do")) {// 정보수정 DB처리후 세션도 수정
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/allView.do")) { // 전체 회원리스트
			service = new MAllViewService();
			service.execute(request, response);
			viewPage = "member/mAllView.jsp";
		}else if(command.equals("/withdrawal.do")) { // 회원탈퇴
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * * * admin 관련 요청  * * * * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/adminLoginView.do")) {
			viewPage = "admin/adminLogin.jsp";
		}else if(command.equals("/adminLogin.do")) {
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "allView.do";
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 * * * * * * * * 파일첨부 게시판 관련 요청  * * * * * * * * * *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * */
		}else if(command.equals("/boardList.do")) {
			service = new FBoardListService();
			service.execute(request, response);
			viewPage = "fileBoard/boardList.jsp";
		}else if(command.equals("/boardWriteView.do")) {
			viewPage = "fileBoard/boardWrite.jsp";
		}else if(command.equals("/boardWrite.do")) {
			service = new FBoardWriteService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}else if(command.equals("/boardContent.do")) {
			service = new FBoardContentService();
			service.execute(request, response);
			viewPage = "fileBoard/boardContent.jsp";
		}else if(command.equals("/boardModifyView.do")) {
			service = new FBoardModifyViewService();
			service.execute(request, response);
			viewPage = "fileBoard/boardModify.jsp";
		}else if(command.equals("/boradModify.do")) {
			service = new FBoardModifyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}else if(command.equals("/boardDelete.do")) {
			service = new FBoardDeleteService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}else if(command.equals("/boardReplyView.do")) {
			service = new FBoardReplyViewService();
			service.execute(request, response);
			viewPage = "fileBoard/boardReply.jsp";
		}else if(command.equals("/boardReply.do")) {
			service = new FBoardReplyService();
			service.execute(request, response);
			viewPage = "boardList.do";
		}
		RequestDispatcher dispathcer = request.getRequestDispatcher(viewPage);
		dispathcer.forward(request, response);		
	}
}
