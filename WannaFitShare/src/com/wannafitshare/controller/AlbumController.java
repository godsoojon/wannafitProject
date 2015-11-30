package com.wannafitshare.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.PhotoUploadService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Photo;
import com.wannafitshare.vo.PhotoUpload;

@Controller
@RequestMapping("/album")
public class AlbumController {
	

	@Autowired
	private PhotoUploadService service;
	
	@RequestMapping("/photoMain")
	public String photoMain(){
		return "photo/photo_main.tiles";
	}
	
	@RequestMapping("/logincheck/write")
	public String write(HttpSession session) {
		return "picture/write2.tiles";
	}
	
	@RequestMapping("/photoSee.do")
	public String photoSee(HttpSession session){
		return  "picture/photo_see.tiles";
	}
	
	@RequestMapping("/logincheck/submit")
	public String submit(@RequestParam String content , @RequestParam String title ,ModelMap model, HttpSession session) throws SQLException{ 
	
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); //cs_id
		int num=0; // photo_id
		String name = (String) session.getAttribute("party"); //party_name		
		Date date = new Date(); 
		num=service.photoNum(); //photo_id 중복피하여 생성 
				
	    //vo를 DB insert에 추가 
	    service.addPhotoUpload(new PhotoUpload(title,num,name,id,date,content)); 
	    //model.addAttribute("content",content);
	    return "/album/logincheck/see.do";
	}
	
	
	/* 내가 올린 사진 보기*/
	@RequestMapping("/logincheck/see.do")
	public String see(HttpSession session, ModelMap model) {
		
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String csId = customer.getCsId(); //cs_id
		List <PhotoUpload> listPhotoUpload = service.listPhotoUpload(csId);
		model.addAttribute("listPhotoUpload", listPhotoUpload);
		return "party/test.tiles";
	}
	
	
	//사진 삭제 처리 
	@RequestMapping("/logincheck/delete.do")
	public String delete(HttpSession session ,@RequestParam int deletephotoId) throws Exception {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId(); //cs_id
		
		//비지니스 로직 - 삭제처리
		service.deletePhotoUploadByPhotoId(deletephotoId);
		//응답
		return "/album/logincheck/see.do";
	}
	
	
	
	//단일파일업로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, Photo vo){
		
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && !vo.getFiledata().isEmpty()){
	        	//파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "photo_upload" + File.separator;              
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	            ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/photo_upload/"+realname;
	            
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println("redirect:" + callback + "?callback_func="+callback_func+file_result);
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	
	
	//다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath +  "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         long timeMilis = System.currentTimeMillis();
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         //매번 파일이름을 다르게하기위해 TimeMillis 사용 
	         String today= formatter.format(new java.util.Date())+timeMilis;
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         //System.out.println("파일경로 : "+filePath);
	         //System.out.println("파일 이름 : "+realFileNm);
	         
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/WannaFitShare/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	        // System.out.println(sFileInfo);
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}



}//class
