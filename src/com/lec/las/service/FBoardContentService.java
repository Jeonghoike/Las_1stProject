package com.lec.las.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.las.dao.FileBoardDao;
import com.lec.las.dto.FileBoardDto;

public class FBoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fid = Integer.parseInt(request.getParameter("fid"));
		FileBoardDao bDao = FileBoardDao.getInstance();
		bDao.hitUp(fid);
		FileBoardDto board = bDao.getFileBoardNotHitUp(fid);
		request.setAttribute("board", board);
	}
}
