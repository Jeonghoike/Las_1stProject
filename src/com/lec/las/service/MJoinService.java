package com.lec.las.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.las.dao.MemberDao;
import com.lec.las.dto.MemberDto;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mtel = request.getParameter("mtel");
		String memail = request.getParameter("memail");
		String mgender = request.getParameter("mgender");
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		System.out.println(mbirthStr == null ? "null":mbirthStr);
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String maddress = request.getParameter("maddress");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto newMember = new MemberDto(mid, mpw, mname, mtel, memail, mgender, mbirth, maddress, null);
		int result = mDao.joinMember(newMember);
		if(result == MemberDao.SUCCESS) { // 가입성공
			HttpSession session = request.getSession();
			session.setAttribute("mid", mid);
			request.setAttribute("joinResult", "회원가입 완료되었습니다");
		}else {
			request.setAttribute("joinErrorMsg", "정보가 너무 길어 회원가입 실패");
		}
	}
}
