package com.lec.las.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.las.dao.FileBoardDao;

public class FBoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fgroup = Integer.parseInt(request.getParameter("fgroup"));
		int fstep = Integer.parseInt(request.getParameter("fstep"));
		int findent = Integer.parseInt(request.getParameter("findent"));
		FileBoardDao boardDao = FileBoardDao.getInstance();
		int deleteCnt = boardDao.deleteFileBoard(fgroup, fstep, findent);
		if(deleteCnt >= FileBoardDao.SUCCESS) {
			request.setAttribute("boaredResult", "글(답변글 포함) "+deleteCnt+"개 글 삭제 성공");
		}else {
			request.setAttribute("boaredResult", "글(답변글도 모두) 삭제 안 됨");
		}
	}
}
