package com.lec.las.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.las.dao.FileBoardDao;
import com.lec.las.dto.FileBoardDto;

public class FBoardReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fid = Integer.parseInt(request.getParameter("fid"));
		FileBoardDao boardDao = FileBoardDao.getInstance();
		FileBoardDto originBoard = boardDao.getFileBoardNotHitUp(fid);
		request.setAttribute("originBoard", originBoard);
	}
}
