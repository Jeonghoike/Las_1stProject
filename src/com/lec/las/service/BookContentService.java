package com.lec.las.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.las.dao.BookDao;
import com.lec.las.dto.BookDto;

public class BookContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bid = Integer.parseInt(request.getParameter("bid"));
		String pageNum = request.getParameter("pageNum");
		BookDao bDao = BookDao.getInstance();
		BookDto book = bDao.getBook(bid);
	}
}
