package com.lec.las.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.las.dao.AdminDao;
import com.lec.las.dao.BookDao;
import com.lec.las.dto.AdminDto;
import com.lec.las.dto.BookDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BookRegisterService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("bookImg");
		int maxSize = 1024*1024*5;
		MultipartRequest mReauest = null;
		String[] image = {"",""};
		int result = BookDao.FAIL;
		try {
			mReauest = new MultipartRequest(request, path, maxSize, "utf-8", 
											new DefaultFileRenamePolicy());
			Enumeration<String> params = mReauest.getFileNames();
			int idx = 0;
			while(params.hasMoreElements()) {
				String param = params.nextElement();
				image[idx] = mReauest.getFilesystemName(param);
				idx++;
			}
			HttpSession httpSession = request.getSession();
			AdminDto admin =(AdminDto)httpSession.getAttribute("admin");
			if(admin!=null) {
				String aid = admin.getAid();
				String btitle = mReauest.getParameter("btitle");
				String bauthor = mReauest.getParameter("bauthor");
				String bimage1 = mReauest.getParameter("bimage1");
				String bimage2 = mReauest.getParameter("bimage2");
				String bcontent = mReauest.getParameter("fcontent");
				BookDao bookDao = BookDao.getInstance();
				BookDto bookDto = new BookDto(0, btitle, bauthor, bimage1, bimage2, bcontent, null);
				result = bookDao.insertBook(bookDto);
				if(result == BookDao.SUCCESS) {
					request.setAttribute("bookResult", "책등록 성공");
				}else {
					request.setAttribute("bookResult", "책등록 실패");
				}
			}else {
				request.setAttribute("bookResult", "관리자로그인 후 등록가능합니다");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		if(image !=null && result==AdminDao.LOGIN_SUCCESS) {
			InputStream  is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+image);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:/webhoe/source/08_1stProject/Las/WebContent/bookImg/");
				byte[] bs = new byte [(int)serverFile.length()];
				while(true){
					int readbyteCnt = is.read(bs);
					if(readbyteCnt==-1) break;
					os.write(bs, 0, readbyteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}
}
