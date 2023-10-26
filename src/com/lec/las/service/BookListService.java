package com.lec.las.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.las.dao.BookDao;
import com.lec.las.dto.BookDto;

public class BookListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 3, BLOCKSIZE = 5;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		BookDao bDao = BookDao.getInstance();
		ArrayList<BookDto> bookList = bDao.listBook(startRow, endRow);
		request.setAttribute("bookList", bookList);
		int bookTotalCnt = bDao.getBookTotalCnt();
		int pageCnt = (int)Math.ceil((double)bookTotalCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage   = startPage + BLOCKSIZE - 1;
		if(endPage > pageCnt){
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSZIE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("bookTotalCnt", bookTotalCnt);
		request.setAttribute("pageNum", pageNum);
	}
}
