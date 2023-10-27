package com.lec.las.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.las.dao.MemberDao;
import com.lec.las.dto.MemberDto;

public class MModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String oldMpw = request.getParameter("oldMpw");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mtel = request.getParameter("mtel");
		String memail = request.getParameter("memail");
		String mgender = request.getParameter("mgender");
		String mbirthStr = request.getParameter("mbirth");		
		Date mbirth = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String maddress = request.getParameter("maddress");
		// DB에 정보 수정
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = new MemberDto(mid, mpw, mname, mtel, memail, mgender, mbirth, maddress, null);
		int result = mDao.modifyMember(mDto);
		if(result == MemberDao.SUCCESS) { // 수정 성공시, 세션도 수정
			HttpSession session = request.getSession();
			session.setAttribute("member", mDto);
			request.setAttribute("modifyResult", "회원 정보 수정 성공");
		}else {
			request.setAttribute("modifyErrorMsg", "회원정보 수정 실패");
		}
	}
}
